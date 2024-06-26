import subprocess
import datetime

def get_cpu_temp():
  """
  Gets the CPU temperature in degrees Celsius.
  """
  try:
    with open("/sys/class/thermal/thermal_zone0/temp", "r") as f:
      cpu_temp = float(f.read()) / 1000
      return cpu_temp
  except FileNotFoundError:
    return None

def get_gpu_temp():
  """
  Gets the GPU temperature in degrees Celsius.
  """
  temp_output = subprocess.check_output(["vcgencmd", "measure_temp"]).decode("utf-8")
  return float(temp_output.split("=")[1].strip()[:-3])

def get_ip_addresses():
  """
  Gets internal and external IP addresses.
  """
  internal_ip = subprocess.check_output(["hostname", "-I"]).decode("utf-8").strip().split(" ")[:3]
  external_ip = subprocess.check_output(["curl", "-s", "https://ipv4.icanhazip.com"]).decode("utf-8").strip()
  return internal_ip, external_ip

def get_date_time():
  """
  Gets the current date and time in a formatted string.
  """
  return datetime.datetime.now().strftime("%A, %d %B %Y, %H:%M:%S")

def get_os_info():
  """
  Gets the operating system name, version, and machine architecture.
  """
  os_info = subprocess.check_output(["lsb_release", "-d", "-r", "-c"]).decode("utf-8").strip().split(":")
  distro = os_info[1].split()[0]
  version = os_info[1].split()[1]
  return f"{distro} {version} ({uname()})"

def uname():
  """
  Gets the kernel name and architecture using the uname command.
  """
  return subprocess.check_output(["uname", "-s", "-m"]).decode("utf-8").strip()

def get_uptime():
  """
  Gets the system uptime in a human-readable format.
  """
  return subprocess.check_output(["uptime", "-p"]).decode("utf-8").strip()

def get_memory_usage():
  """
  Gets the total and used memory from the free command output.
  """
  mem_output = subprocess.check_output(["free", "-h"]).decode("utf-8").strip().split("\n")
  mem_info = mem_output[1].split()[1:3]
  return mem_info

def get_running_processes():
  """
  Gets the number of running processes using the ps command.
  """
  return int(subprocess.check_output(["ps", "aux", "|", "wc", "-l"]).decode("utf-8").strip())

if __name__ == "__main__":
  cpu_temp = get_cpu_temp()
  gpu_temp = get_gpu_temp()
  internal_ip, external_ip = get_ip_addresses()
  date_time = get_date_time()
  os_info = get_os_info()
  uptime = get_uptime()
  memory_usage = get_memory_usage()
  running_processes = get_running_processes()

  print(f"CPU Temp: {cpu_temp if cpu_temp is not None else 'NA'}°C")
  print(f"GPU Temp: {gpu_temp}°C")
  print(f"Internal IP(s): {', '.join(internal_ip)}")
  print(f"External IP: {external_ip}")
  print(f"Date & Time: {date_time}")
  print(f"OS Info: {os_info}")
  print(f"Uptime: {uptime}")
  print(f"Memory Usage: {memory_usage[0]} used / {memory_usage[1]} total")
  print(f"Running Processes: {running_processes}")
