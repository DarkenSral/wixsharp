﻿using System.Diagnostics;
using WixSharp;
using WixSharp.CommonTasks;
using WixToolset.Dtf.WindowsInstaller;

public static class Script
{
    static public void Main()
    {
        // THIS SAMPLE IS NOT PORTED TO WIX4 yet

        ProductActivationDialogSetup.Build();
        //MultiStepDialogSetup.Build();
        //EmptyDialogSetup.Build();
    }
}