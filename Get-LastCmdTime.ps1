 function Get-LastCmdTime
 {
    $diffPromptTime = $null
   
    $lastCmd = Get-History -Count 1
    if ($lastCmd -ne $null) {
        $diff = $lastCmd.EndExecutionTime - $lastCmd.StartExecutionTime
        try 
        {
        # assumes humanize has been installed:
          $diffPromptTime = $diff.Humanize()
        }
        catch
        {
          $diffPromptTime = $diff.ToString("hh\:mm\:ss")
        }
        $diffPromptTime
    }
 }