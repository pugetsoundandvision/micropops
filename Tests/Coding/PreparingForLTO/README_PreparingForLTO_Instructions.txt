PREPARING TO WRITE TO LTO

1) AIP the files! 

Edit your VideoAIP settings using "videoaip -e". Indicate if you want the AIP to sync elsewhere, if you want the original to then be deleted, and if you want the mp4 access copies synced elsewhere.

VideoAIP should ignore any hidden files and not include them in any of the manifests. You can use a loop to identify all of the MKVs in a directory and AIP them. Use:
	find [DIR] -iname "*.mkv"
	while read TARGET
	do videoaip -l auto "$TARGET" </dev/null
	done < <(find [DIR] -name '*.mkv')
	
2) You'll be left with parent directories that contain: the AIP, and the original files. To move all of the AIPS to each folder, modify this script to adhere to each collection's naming conventions:

find [DIR to the subfolder level] /Users/mipopsmac2/Desktop/AIP_TEST/AIP_TEST*/* -maxdepth 0 -type d | while read TARGET ; do mv "$TARGET" [DIR - location you want them moved to] /Users/mipopsmac2/Desktop/AIP_TEST/OnlyNewAIPS ; done

Once you've checked to see if the files were moved correctly, you can delete the other directories with the un-AIPed files.

2) Check for hidden files using:
	find [dir] -iname "*._*"
	
3) If hidden files are listed, delete them using: 
	find [dir] -iname "*._*" -delete
	
4) Check for hidden files again using: 
	find [dir] -iname "*._*". 