# Define bash shell variable called var 
# Avoid spaces around the assignment operator (=)
var="Hello World from hellopi.sh"


now="$(date)"
computer_name="$(hostname)"
# print it 
echo "$var"
 
# Another way of printing it
printf "%s\n" "$var"
echo "$var"
echo "Current date and time : $now"
echo "Computer name : $computer_name"
echo ""