using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.ARFoundation;
using UnityEngine.XR.ARSubsystems;
using EnhancedTouch = UnityEngine.InputSystem.EnhancedTouch;


public class B_GameManager : MonoBehaviour
{

    [SerializeField] ARRaycastManager m_RaycastManager;
    [SerializeField] ARPlaneManager m_ARPlaneManager;
    [SerializeField] GameObject spawnablePrefab;
    [SerializeField] Camera gameCam;
    [SerializeField] Transform ship;
    [SerializeField] Transform shipGimbal;


     [SerializeField] List<Vector3> PositionsChain = new List<Vector3>();
    private float LastTimePositionUpdated = 0;

    private Vector3 ShipStartLoc;
    private Vector3 TapLocation;
    private Vector3 LerpLoc;

    [SerializeField] GameObject HitLocationObj;
    [SerializeField] Transform shiptarget;

    [SerializeField] GameObject AimerMesh;
    [SerializeField] GameObject ShipMesh;

    private List<ARRaycastHit> hits = new List<ARRaycastHit>();



    private void OnEnable()
    {
        EnhancedTouch.TouchSimulation.Enable();
        EnhancedTouch.EnhancedTouchSupport.Enable();
        EnhancedTouch.Touch.onFingerDown += FingerDown;
    }


    private void OnDisable()
    {
        EnhancedTouch.TouchSimulation.Disable();
        EnhancedTouch.EnhancedTouchSupport.Disable();
        EnhancedTouch.Touch.onFingerDown -= FingerDown;
    }
    



    private void FingerDown(EnhancedTouch.Finger finger)
    {
        if (finger.index != 0) return;
        Debug.Log("click");
       
        if(m_RaycastManager.Raycast(finger.currentTouch.screenPosition, hits, TrackableType.PlaneWithinPolygon))
        {
            Debug.Log("we found a click");
            foreach (ARRaycastHit hit in hits)
            {
    
                Pose pose = hit.pose;
              
                if (HitLocationObj)
                {
                    HitLocationObj.transform.position = pose.position;
                    HitLocationObj.transform.rotation = pose.rotation;
                    TapLocation = hit.pose.position;
                }
            
                else
                {
                   // HitLocationObj = Instantiate(spawnablePrefab, pose.position, pose.rotation);
                    TapLocation = hit.pose.position;
                }
                
            }        
        }
    }


    // Start is called before the first frame update
    void Start()
    {

        if (ship)
        {
            ShipStartLoc = ship.position;
            LerpLoc = ShipStartLoc;
            TapLocation = ShipStartLoc;
        }

    }

    // Update is called once per frame
    void Update()
    {
        /*
        if (HitLocationObj)
        {  

            if (ShipMesh)
            {
                Vector3 currentShipLoc = ShipMesh.transform.position;
                var Lerploc = Vector3.Lerp(ShipMesh.transform.position, HitLocationObj.transform.position, Time.deltaTime * 0.4f);
                var LookAtRot = Quaternion.LookRotation(ShipMesh.transform.position - HitLocationObj.transform.position);
                var LookLerp = Quaternion.Lerp(ShipMesh.transform.rotation, LookAtRot, Time.deltaTime * 2);
                ShipMesh.transform.rotation = LookLerp;
                ShipMesh.transform.position = Lerploc;
            }

        }
        */

    }

    private Vector3 UpdatePath(Vector3 PathLoc)
    {
        Vector3 CurrentOutLoc = PathLoc;

        if (Time.time -LastTimePositionUpdated > .03f)
        {
            LastTimePositionUpdated = Time.time;
            PositionsChain.Add(PathLoc);
            if(PositionsChain.Count > 30)
            {
                PositionsChain.RemoveAt(0);
            }
        }

        if (PositionsChain.Count > 0)
        {
            return PositionsChain[0];
        }


        return CurrentOutLoc;
    }




    private void UpdateShip()
    {
        if (HitLocationObj && ship)
        {
            Vector3 CamAim = new Vector3(gameCam.transform.forward.x, 0, gameCam.transform.forward.z).normalized;
            Vector3 offsetAim = gameCam.transform.position + (CamAim * 50);
            Vector3 TargetLoc = new Vector3(offsetAim.x, HitLocationObj.transform.position.y, offsetAim.z);
            HitLocationObj.transform.position = TargetLoc;

            Vector3 Loc = TargetLoc - ship.position;
            Quaternion rot = Quaternion.LookRotation(Loc, Vector3.up);
            Quaternion lerpRot = Quaternion.Lerp(ship.rotation, rot, Time.deltaTime * .1f);

            ship.rotation = lerpRot;
            LerpLoc = Vector3.Lerp(ship.position, TargetLoc, Time.deltaTime * 0.2f);
            ship.position = LerpLoc;

            Vector3 A = gameCam.transform.position - ship.position;
            Vector3 B = gameCam.transform.forward;
            Vector3 ShipForwardNormal = new Vector3(A.x, 0, A.z).normalized;
            Vector3 CamForwardNormal = new Vector3(B.x, 0, B.z).normalized;
            float yaw = Vector3.Dot(ShipForwardNormal, CamForwardNormal) + 1;
            shipGimbal.localRotation = Quaternion.Euler(yaw * 45, 90, 0);

        }

    }


}
