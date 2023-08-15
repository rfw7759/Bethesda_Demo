using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Game_Ship : MonoBehaviour
{

    [SerializeField] LineRenderer line;
    [SerializeField] Transform LineStart;
    [SerializeField] Transform LineEnd;

    [SerializeField] Camera gameCam;
    [SerializeField] Transform Ta;
    [SerializeField] Transform ShipNameText;


    // Start is called before the first frame update
    void Start()
    {
        
    }

 

    // Update is called once per frame
    void Update()
    {
        line.SetPosition(0, LineStart.position);
        line.SetPosition(1, LineEnd.position);

        if (Ta)
        {
            Vector3 Loc = Ta.position - ShipNameText.position;
            Quaternion rot = Quaternion.LookRotation(Loc, Vector3.up);
            ShipNameText.rotation = rot;
           
           


        }
       

    }
}
