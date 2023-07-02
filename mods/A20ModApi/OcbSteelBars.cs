using HarmonyLib;
using UnityEngine;
using System.Reflection;

public class OcbSteelBarsPatch : IModApi
{

    public void InitMod(Mod mod)
    {
        Log.Out("OCB Harmony Patch: " + GetType().ToString());
        Harmony harmony = new Harmony(GetType().ToString());
        harmony.PatchAll(Assembly.GetExecutingAssembly());
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
            // Simply make the cast radius narrower to trigger a physical raycast internally
            // This should be enough for the motion sensor to see through narrow spaces
            if (_layerMask == -538750981 && _hitMask == 8 && _sphereRadius == 0.1f) {
                _sphereRadius = 0.005f;
            }
            return true;
        }
    }

}
