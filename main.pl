$root_path = '';
if (scalar @ARGV > 0) {
    $root_path = @ARGV[0];
} else {
    exit;
}

print $root_path;
