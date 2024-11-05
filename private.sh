main() {
clear
echo -e "[...] Downloading Polaris UI assets"
curl "https://drive.google.com/uc?export=download&id=1AUrnsNIzhzD53PTBXIn-qOcBdLUn0iIL" -o "./Polaris.zip"
unzip -o -q "./Polaris.zip"
test -d "/Applications/Polaris.app" && rm -rf "/Applications/Polaris.app"
mv ./Polaris.app /Applications/Polaris.app
rm ./PolarisUI.zip
test -d "/Applications/Roblox.app" && rm -rf "/Applications/Roblox.app"
echo -e "[...] Installing Roblox - (version-35fcbd5d50d74403)"
curl "https://setup.rbxcdn.com/mac/version-35fcbd5d50d74403-RobloxPlayer.zip" -o "./RobloxPlayer.zip"
unzip -o -q "./RobloxPlayer.zip"
rm -rf /Applications/Roblox.app
mv ./RobloxPlayer.app /Applications/Roblox.app
rm ./RobloxPlayer.zip
xattr -c /Applications/Roblox.app
echo -e "[...] Downloading main executable"
curl "https://drive.google.com/uc?export=download&id=1O0VhFCu-ulmnueF5yFUqTXIC3Lc8o_xG" -o "./libpolaris.zip"
unzip -o -q "./libPolaris.zip"
mv ./libPolaris.dylib /Applications/Roblox.app/Contents/MacOS/libPolaris.dylib
echo -e "[...] Patching client"
curl "https://github.com/bluetoasterr/polaris/raw/main/ClientPatcher" -o "ClientPatcher"
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
