
$(document).ready(
	$('#quick_search').dataTable()



);

function writeInFile() {




    var fso = new ActiveXObject("Scripting.FileSystemObject");
    var fh = fso.OpenTextFile("entry_log.txt", 8, false, 0);
    fh.WriteLine('test');
    fh.Close();





// 	console.log("YOYO");
// 	var fs = fopen("entry_log.txt", 3); // Open the file for writing

// 	if(fd != -1) // If the file has been successfully opened
// {
//     var str = "Some text goes here...";
//     fwrite(fd, str); // Write the string to a file
//     fclose(fd); // Close the file 
// }
}
