if [[ $2 != "" && $2 == "fvm" ]]
then
fvm flutter build ipa
open build/ios/ipa
else
flutter build ipa
open build/ios/ipa
fi
echo "Ipa Successfully!"