# has_unicode
bash function to detect whether the current terminal supports Unicode

# Usage

Source it:

    . ./has_unicode.sh

Execute the function:

    has_unicode

If the terminal supports Unicode, you'll have a return value (in $?) of 0, and the UNICODE_AVAILABLE variable will be set to 1. If Unicode is not available, $? will contain 1 and UNICODE_AVAILABLE will be 0. 

Thus, you can use has_unicode in an if/then, check the $? immediately after calling the function, or you can check the variable. You don't generally need to use both; the UNICODE_AVAILABLE variable is there just in case you want to use it in multiple places in your script.
