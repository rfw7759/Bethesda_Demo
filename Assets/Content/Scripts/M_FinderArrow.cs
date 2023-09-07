using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class M_FinderArrow : MonoBehaviour
{

    [SerializeField] Camera gameCam;
    [SerializeField] Transform ShipLoc;


    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {

        Vector3 newPos = new Vector3(gameCam.transform.position.x, gameCam.transform.position.y - 0.3f, gameCam.transform.position.z);
      //  transform.position = newPos + (gameCam.transform.forward * 1);
        var LookAtRot = Quaternion.LookRotation(ShipLoc.position - transform.position);
        transform.rotation = LookAtRot;
    }
}
