use Cwd;
use strict;
use warnings;

my $root_path = '';
if (scalar @ARGV > 0) {
    $root_path = $ARGV[0];
} else {
    die 'Enter root path of project';
}

if (!-d $root_path) {
    die 'Root path of project not found';
}

my $current_folder_path = getcwd();

my @result_list = ();
my $log_file_path = "@{[$current_folder_path]}/access.log";
open(my $log_file, '<', $log_file_path) or die 'Cannot open log file';
while (my $line = <$log_file>) {
    if (my @path_search_result = $line =~ m/\d]\s"[A-Z]{3,7}\s(\/[^\s]+?)\s/is) {
        my $path_search = "@{[$root_path]}@{[$path_search_result[0]]}";
        if (-f $path_search) {
            push @result_list, $line;
        }

        print @result_list;
        print "\n";
    }
}
close $log_file;

# my $result_file_path = "@{[$current_folder_path]}/result.txt";
# open(my $result_file, '>', $result_file_path) or exit 'Cannot create or open result file';
# # print $result_file 'Проверка';
# close $result_file;

print 'Done';
