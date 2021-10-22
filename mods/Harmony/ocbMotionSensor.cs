using DMT;
using HarmonyLib;
using UnityEngine;
using System.Reflection;

public class OcbNoWires
{
    public class OcbNoWires_Init : IHarmony
    {
        public void Start()
        {
            Debug.Log("Loading OCB Motion Sensor Patch: " + GetType().ToString());
            var harmony = new Harmony(GetType().ToString());
            harmony.PatchAll(Assembly.GetExecutingAssembly());
        }
    }
/*
  public static bool Raycast(
    World _world,
    Ray ray,
    float distance,
    int _layerMask,
    int _hitMask,
    float _sphereRadius)
*/

    [HarmonyPatch(typeof(Voxel))]
    [HarmonyPatch("raycastNew")]
    public class Voxel_raycastNew
    {
        static bool Prefix(
            int _layerMask,
            int _hitMask,
            ref float _sphereRadius)
        {
            if (_layerMask == -538750981 && _hitMask == 8 && _sphereRadius == 0.1f) {
                _sphereRadius = 0.005f;
            }
            return true;
        }
    }

}
