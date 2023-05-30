Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
color b

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Lunar Client Crack'
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = 'CenterScreen'

$LauchClient = New-Object System.Windows.Forms.Button
$LauchClient.Location = New-Object System.Drawing.Point(75,120)
$LauchClient.Size = New-Object System.Drawing.Size(75,23)
$LauchClient.Text = 'Chạy'
$LauchClient.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $LauchClient
$form.Controls.Add($LauchClient)

$ExitClient = New-Object System.Windows.Forms.Button
$ExitClient.Location = New-Object System.Drawing.Point(150,120)
$ExitClient.Size = New-Object System.Drawing.Size(75,23)
$ExitClient.Text = 'Thoát'
$ExitClient.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $ExitClient
$form.Controls.Add($ExitClient)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Nhập tên của bạn :)'
$form.Controls.Add($label)

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(10,40)
$textBox.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBox)

$form.Topmost = $true

$form.Add_Shown({$textBox.Select()})
$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $playerName = $textBox.Text
}

if ($result -eq [System.Windows.Forms.DialogResult]::Cancel)
{
    exit
}

if (-Not (Test-Path "$env:userprofile\.lunarclient\Mods\CrackedAccount.jar")) {
  echo "Đang tải file [1/4]..."
  Invoke-WebRequest -Uri "https://github.com/Nilsen84/lunar-client-agents/releases/download/v1.2.0/CrackedAccount.jar" -OutFile "$env:userprofile\.lunarclient\Mods\CrackedAccount.jar"
}

if (-Not (Test-Path "$env:userprofile\.lunarclient\Mods\StaffEnable.jar")) {
  echo "Đang tải file [2/4]..."
  Invoke-WebRequest -Uri "https://github.com/Nilsen84/lunar-client-agents/releases/download/v1.2.0/StaffEnable.jar" -OutFile "$env:userprofile\.lunarclient\Mods\StaffEnable.jar"
}

if (-Not (Test-Path "$env:userprofile\.lunarclient\Mods\HitDelayFix.jar")) {
  echo "Đang tải file [3/4]..."
  Invoke-WebRequest -Uri "https://github.com/Nilsen84/lunar-client-agents/releases/download/v1.2.0/HitDelayFix.jar" -OutFile "$env:userprofile\.lunarclient\Mods\HitDelayFix.jar"
}
if (-Not (Test-Path "$env:userprofile\.lunarclient\Mods\LunarPacksFix.jar")) {
  echo "Đang tải file [4/4]..."
  Invoke-WebRequest -Uri "https://github.com/Nilsen84/lunar-client-agents/releases/download/v1.2.0/LunarPacksFix.jar" -OutFile "$env:userprofile\.lunarclient\Mods\LunarPacksFix.jar"
}
cls
echo "  _     ____    ____                _            _ 
 | |   / ___|  / ___|_ __ __ _  ___| | _____  __| |
 | |  | |     | |   | '__/ _`  |/ __| |/ / _ \/ _`  |
 | |__| |___  | |___| | | (_| | (__|   <  __/ (_| |
 |_____\____|  \____|_|  \__,_|\___|_|\_\___|\__,_|
                                                   "
echo "Lunar Client Cracked - by DuyHungRev"
echo "Đang khởi động..."
if ($playerName -eq "") {
	exit
}
$javaJre = (Resolve-Path "$env:userprofile\.lunarclient\jre\*\zulu17*\bin")[0]
cd "$env:userprofile\.lunarclient\offline\multiver"

$launchArgs = "--add-modules", "jdk.naming.dns", "--add-exports", "jdk.naming.dns/com.sun.jndi.dns=java.naming", "-Djna.boot.library.path=$env:userprofile\.lunarclient\offline\multiver\natives", "-Dlog4j2.formatMsgNoLookups=true", "--add-opens", "java.base/java.io=ALL-UNNAMED", "-javaagent:$env:userprofile\.lunarclient\CrackedAccount.jar=$playerName", "-javaagent:$env:userprofile\.lunarclient\StaffEnable.jar", "-javaagent:$env:userprofile\.lunarclient\Mods\HitDelayFix.jar", "-javaagent:$env:userprofile\.lunarclient\Mods\UnlockCosmetics.jar", "-Xms1G", "-Xmx4000m", "-Xmn768m", "-XX:+DisableAttachMechanism", "-Djava.library.path=$env:userprofile\.lunarclient\offline\multiver\natives", "-cp", "lunar-lang.jar;lunar-emote.jar;lunar.jar;optifine-0.1.0-SNAPSHOT-all.jar;v1_8-0.1.0-SNAPSHOT-all.jar;common-0.1.0-SNAPSHOT-all.jar;genesis-0.1.0-SNAPSHOT-all.jar", "com.moonsworth.lunar.genesis.Genesis", "--version", "1.8.9", "--accessToken", "0", "--assetIndex", "1.8"
if ($args[1]) {
  $launchArgs += '--gameDir', $args[1]
}
$launchArgs += "--userProperties", "{}", "--texturesDir", "$env:userprofile\.lunarclient\textures", "--width", "854", "--height", "480", "--ichorClassPath", "lunar-lang.jar,lunar-emote.jar,lunar.jar,optifine-0.1.0-SNAPSHOT-all.jar,v1_8-0.1.0-SNAPSHOT-all.jar,common-0.1.0-SNAPSHOT-all.jar,genesis-0.1.0-SNAPSHOT-all.jar", "--ichorExternalFiles", "OptiFine_v1_8.jar", "--workingDirectory", ".", "--classpathDir", "$env:userprofile\.lunarclient\offline\multiver"

& "$javaJre\java.exe" $launchArgs
