{
    fileSystems =
        let
        ntfs-drives = [
            "/mnt/nvme1"
        ];
    in
    lib.genAttrs ntfs-drives (path: {
        options = [
            "uid=1000" # REPLACE "$UID" WITH YOUR ACTUAL UID!
        # "nofail"
        ];
    });
}