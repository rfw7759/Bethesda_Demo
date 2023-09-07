// Made with Amplify Shader Editor v1.9.2
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "A_Main"
{
	Properties
	{
		_TextureSample0("Texture Sample 0", 2D) = "white" {}
		_TextureSample1("Texture Sample 0", 2D) = "white" {}
		_TextureSample2("Texture Sample 0", 2D) = "white" {}
		_TextureSample3("Texture Sample 0", 2D) = "white" {}
		_TextureSample4("Texture Sample 0", 2D) = "white" {}
		_TextureSample5("Texture Sample 0", 2D) = "bump" {}
		_metalic("metalic", Float) = 1
		_rough("rough", Float) = 1
		_Color1("Color 1", Color) = (0.1675165,1,0,0)
		_Color0("Color 0", Color) = (1,0,0,0)
		_Float2("Float 0", Float) = 6
		_Float3("Float 0", Float) = 2
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows exclude_path:deferred 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _TextureSample5;
		uniform float4 _TextureSample5_ST;
		uniform sampler2D _TextureSample0;
		uniform float4 _TextureSample0_ST;
		uniform float4 _Color0;
		uniform float4 _Color1;
		uniform float _Float3;
		uniform sampler2D _TextureSample1;
		uniform float4 _TextureSample1_ST;
		uniform float _Float2;
		uniform sampler2D _TextureSample2;
		uniform float4 _TextureSample2_ST;
		uniform float _metalic;
		uniform sampler2D _TextureSample4;
		uniform float4 _TextureSample4_ST;
		uniform float _rough;
		uniform sampler2D _TextureSample3;
		uniform float4 _TextureSample3_ST;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_TextureSample5 = i.uv_texcoord * _TextureSample5_ST.xy + _TextureSample5_ST.zw;
			o.Normal = UnpackNormal( tex2D( _TextureSample5, uv_TextureSample5 ) );
			float2 uv_TextureSample0 = i.uv_texcoord * _TextureSample0_ST.xy + _TextureSample0_ST.zw;
			o.Albedo = tex2D( _TextureSample0, uv_TextureSample0 ).rgb;
			float4 temp_cast_1 = (0.0).xxxx;
			float mulTime29 = _Time.y * _Float3;
			float4 lerpResult25 = lerp( _Color0 , _Color1 , sin( mulTime29 ));
			float2 uv_TextureSample1 = i.uv_texcoord * _TextureSample1_ST.xy + _TextureSample1_ST.zw;
			float mulTime24 = _Time.y * _Float2;
			float4 lerpResult19 = lerp( temp_cast_1 , ( lerpResult25 * tex2D( _TextureSample1, uv_TextureSample1 ) ) , sin( mulTime24 ));
			o.Emission = lerpResult19.rgb;
			float2 uv_TextureSample2 = i.uv_texcoord * _TextureSample2_ST.xy + _TextureSample2_ST.zw;
			float clampResult33 = clamp( ( tex2D( _TextureSample2, uv_TextureSample2 ).r * _metalic ) , 0.0 , 1.0 );
			o.Metallic = clampResult33;
			float2 uv_TextureSample4 = i.uv_texcoord * _TextureSample4_ST.xy + _TextureSample4_ST.zw;
			float clampResult34 = clamp( ( tex2D( _TextureSample4, uv_TextureSample4 ).r * _rough ) , 0.0 , 1.0 );
			o.Smoothness = clampResult34;
			float2 uv_TextureSample3 = i.uv_texcoord * _TextureSample3_ST.xy + _TextureSample3_ST.zw;
			o.Occlusion = tex2D( _TextureSample3, uv_TextureSample3 ).r;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=19200
Node;AmplifyShaderEditor.SamplerNode;11;-395.4879,542.7631;Inherit;True;Property;_TextureSample2;Texture Sample 0;2;0;Create;True;0;0;0;False;0;False;-1;c8d9f4c6e921abe45a0d57dda6e41b1f;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;12;-394.3162,753.669;Inherit;True;Property;_TextureSample3;Texture Sample 0;3;0;Create;True;0;0;0;False;0;False;-1;6facb0ac0f3e7eb4b9113c3cbfe61e2a;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;13;-382.4127,976.9711;Inherit;True;Property;_TextureSample4;Texture Sample 0;4;0;Create;True;0;0;0;False;0;False;-1;6f05c1eeba3772f47a488507842d5bf9;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;14;-339.2518,1185.419;Inherit;True;Property;_TextureSample5;Texture Sample 0;5;0;Create;True;0;0;0;False;0;False;-1;a280e6795712cd24882025bfc62649ea;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;9;-408.7023,249.7853;Inherit;True;Property;_TextureSample0;Texture Sample 0;0;0;Create;True;0;0;0;False;0;False;-1;4991231c8946712469bd1766d195a15c;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;10;-224.4725,23.04359;Inherit;True;Property;_TextureSample1;Texture Sample 0;1;0;Create;True;0;0;0;False;0;False;-1;4ac38e6515aff8747bc1ec64b9be481c;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;20;46.15596,-339.5092;Inherit;False;Constant;_Float1;Float 1;7;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;138.6516,-20.91233;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;425.4579,225.4063;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;A_Main;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;;0;False;;False;0;False;;0;False;;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;ForwardOnly;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;0;0;False;;0;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.LerpOp;19;237.571,-162.2254;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;25;-80.98949,-607.7859;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;27;-381.6766,-546.8831;Inherit;False;Property;_Color1;Color 1;9;0;Create;True;0;0;0;False;0;False;0.1675165,1,0,0;0.1675165,1,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SinOpNode;17;-455.5501,-50.26216;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;24;-639.2573,-173.5901;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;22;-830.3372,-160.8316;Inherit;False;Property;_Float2;Float 0;11;0;Create;True;0;0;0;False;0;False;6;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;28;-629.5742,-488.013;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;29;-813.2814,-611.3409;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;30;-1004.361,-598.5825;Inherit;False;Property;_Float3;Float 0;12;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;16;-108.004,-76.15292;Inherit;False;Property;_Float0;Float 0;6;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;33;204.2611,328.0212;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;31;-13.73889,348.0212;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;32;-117.7389,458.0212;Inherit;False;Property;_metalic;metalic;7;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;34;246.2611,558.0212;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;35;28.26111,578.0212;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;36;-76.7389,689.0212;Inherit;False;Property;_rough;rough;8;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;26;-387.7916,-728.9831;Inherit;False;Property;_Color0;Color 0;10;0;Create;True;0;0;0;False;0;False;1,0,0,0;1,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
WireConnection;15;0;25;0
WireConnection;15;1;10;0
WireConnection;0;0;9;0
WireConnection;0;1;14;0
WireConnection;0;2;19;0
WireConnection;0;3;33;0
WireConnection;0;4;34;0
WireConnection;0;5;12;1
WireConnection;19;0;20;0
WireConnection;19;1;15;0
WireConnection;19;2;17;0
WireConnection;25;0;26;0
WireConnection;25;1;27;0
WireConnection;25;2;28;0
WireConnection;17;0;24;0
WireConnection;24;0;22;0
WireConnection;28;0;29;0
WireConnection;29;0;30;0
WireConnection;33;0;31;0
WireConnection;31;0;11;1
WireConnection;31;1;32;0
WireConnection;34;0;35;0
WireConnection;35;0;13;1
WireConnection;35;1;36;0
ASEEND*/
//CHKSM=04F2648CDC1506720AC4091C40832D1A8A6165C2