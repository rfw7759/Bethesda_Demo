using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PingPong : MonoBehaviour
{

    public float lerpspeed = 10.0f;
    float LerpRot;




    public float WaveSizeX = 5;
    public float WaveSizeY = 5;
    public float WaveSizeZ = 5;

    public float XOffset = 1;
    public float YOffset = 1;
    public float ZOffset = 1;



    public float RotationMult = 1;
    public float PositionMult = 1;


    protected float InitialRoll;
    protected float InitialPitch;
    protected float InitialYaw;

    protected float Initialx;
    protected float Initialy;
    protected float Initialz;

    protected float Initialoffset;

    protected Vector3 InitialScale;
    public float ScaleOffset = 1;
    public float ScaleMult = 1;

    // Use this for initialization
    void Start()
    {
        InitialScale = transform.localScale;

        InitialRoll = transform.localRotation.x;
        InitialPitch = transform.localRotation.y;
        InitialYaw = transform.localRotation.z;

        Initialx = transform.localPosition.x;
        Initialy = transform.localPosition.y;
        Initialz = transform.localPosition.z;



        Initialoffset = 0;
    }

    // Update is called once per frame
    void Update()
    {
        InitialYaw = InitialYaw + Time.deltaTime * 22;


        Vector3 rotationUpdate = new Vector3(  ((float)Mathf.Sin((Time.time * lerpspeed)) * WaveSizeX),
                                            ((float)Mathf.Sin((Time.time * lerpspeed)) * WaveSizeY),
                                             ((float)Mathf.Sin((Time.time * lerpspeed)) * WaveSizeZ ));

        transform.localRotation = Quaternion.Euler(rotationUpdate);



        transform.localPosition = new Vector3(Initialx + ((float)Mathf.Sin((Time.time + Initialoffset) * XOffset) * WaveSizeX * PositionMult),
                                         Initialy + ((float)Mathf.Sin((Time.time + Initialoffset) * YOffset) * WaveSizeY * PositionMult),
                                         Initialz + ((float)Mathf.Sin((Time.time + Initialoffset) * ZOffset) * WaveSizeZ * PositionMult));


       // transform.localScale = InitialScale + (new Vector3(1, 1, 1) * (float)Mathf.Sin((Time.time * ScaleOffset) * WaveSizeX) * ScaleMult);


    }
}
