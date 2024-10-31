main() {
clear
echo -e "[ Polaris V1 Install Script | @norbyx1_ ]"
echo -e "----------------------------------------------------"
echo -e "[...] Downloading Polaris UI assets"
curl "https://djtthjozgtvcaixs.public.blob.vercel-storage.com/PolarisUI.zip" -o "./PolarisUI.zip"
unzip -o -q "./PolarisUI.zip"
test -d "/Applications/Polaris.app" && rm -rf "/Applications/Polaris.app"
mv ./Polaris.app /Applications/Polaris.app
rm ./PolarisUI.zip
test -d "/Applications/Roblox.app" && rm -rf "/Applications/Roblox.app"
echo -e "[...] Installing Roblox - ($version)"
curl "https://setup.rbxcdn.com/mac/$version-RobloxPlayer.zip" -o "./RobloxPlayer.zip"
unzip -o -q "./RobloxPlayer.zip"
rm -rf /Applications/Roblox.app
mv ./RobloxPlayer.app /Applications/Roblox.app
rm ./RobloxPlayer.zip
xattr -c /Applications/Roblox.app
echo -e "[...] Downloading main executable"
curl "https://djtthjozgtvcaixs.public.blob.vercel-storage.com/libPolaris.zip" -o "./libPolaris.zip"
unzip -o -q "./libPolaris.zip"
mv ./libPolaris.dylib /Applications/Roblox.app/Contents/MacOS/libPolaris.dylib
echo -e "[...] Patching client"
curl "https://raw.githubusercontent.com/devnorb/Polaris/main/ClientPatcher" -o "ClientPatcher"
chmod +x ClientPatcher
./ClientPatcher "/Applications/Roblox.app/Contents/MacOS/libPolaris.dylib" "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer" --strip-codesig --all-yes >/dev/null 2>&1
mv "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer_patched" "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer"
rm -rf ./ClientPatcher ./libPolaris.zip ./PolarisUI.zip
mkdir -p ~/Documents/Polaris/workspace
mkdir -p ~/Documents/Polaris/autoexec
mkdir -p ~/Documents/Polaris/modules
echo -e "[ Finished Polaris Install ]"
exit
}
main
