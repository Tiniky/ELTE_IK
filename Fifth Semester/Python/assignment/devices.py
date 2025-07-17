from enum import Enum
from abc import ABC, abstractmethod
import random
import time
import tkinter as tk
from threading import Thread
from tkinter import *
from tkinter.simpledialog import askstring

MIN_VALUE = 0
MAX_VALUE = 100

#the Abstract Base Class
class Device(ABC):
    #static variable for device ID
    device_id = 0

    class Mode(Enum):
        ON = "ON"
        OFF = "OFF"

    def __init__(self):
        Device.device_id += 1
        self.device_id = Device.device_id
        self.mode = self.Mode.OFF

    def __str__(self):
        return f"(ID:{self.device_id}): {self.mode.value}"
    
    def turn_on(self):
        self.mode = Device.Mode.ON

    def turn_off(self):
        self.mode = Device.Mode.OFF
    
    def get_mode(self):
        return self.mode.value
    
    @abstractmethod
    def handle_events(self):
        pass

#Smart Lights
class SmartLights(Device):
    brightness = 0
    def __init__(self):
        try:
            super().__init__()
            self.brightness = random.randint(MIN_VALUE,MAX_VALUE)
            self.turn_on()
        except ValueError as e:
            print(f"Oh no something went wrong during device initialization: {e}")
        except Exception as e:
            print(f"An unexpected error occurred: {e}")

    def handle_events(self):
        num = random.randint(2,6)

        if self.get_mode() == "ON":
            self.brightness += num
        else:
            self.brightness -= num

        if self.brightness < 0:
            self.brightness = 0
        elif self.brightness > 100:
            self.brightness = 100

        if self.get_brightness() < 40:
            self.turn_on() 
        elif self.get_brightness() > 80:
            self.turn_off()

    def __str__(self):
        return f"Smart Light (ID:{self.device_id}): {self.mode.value}, current brightness: {self.get_brightness()}"

    def get_brightness(self):
        return self.brightness

#Thermostat
class Thermostat(Device):
    temperature = 0
    def __init__(self):
        try:
            super().__init__()
            self.temperature = round(random.uniform(10, 20),2)
        except ValueError as e:
            print(f"Oh no something went wrong during device initialization: {e}")
        except Exception as e:
            print(f"An unexpected error occurred: {e}")

    def handle_events(self):
        num = round(random.uniform(1,3),2)
        num2 = random.randint(2,5)

        if num2 % 2 == 0 and self.get_mode() == "ON":
            self.temperature += num
        else:
            if self.get_mode() == "ON":
                self.temperature += num
            else:
                self.temperature -= num
        
        if self.get_temperature() < 18:
            self.turn_on()
        elif self.get_temperature() > 24: 
            self.turn_off()

    def __str__(self):
        return f"Thermostat (ID:{self.device_id}): {self.mode.value}, current temperature: {self.get_temperature()}"

    def get_temperature(self):
        return self.temperature
        
#Security Camera
class SecurityCamera(Device):
    motion_detected = False
    def __init__(self):
        super().__init__()
        self.turn_on()

    def handle_events(self):
        if self.get_mode() == "ON":
            num = random.randint(MIN_VALUE,MAX_VALUE)
            
            if self.get_motion_detected() == True:
                if num % 2 == 0:
                    self.motion_detected = False
            
            if num > 90:
                self.motion_detected = True
                self.send_alarm()

    def __str__(self):
        return f"Security camera (ID:{self.device_id}): {self.mode.value}, motion: {self.get_motion_detected()}"
    
    def send_alarm(self):
        print("Movement has been detected!")
            
    def get_motion_detected(self):
        return self.motion_detected
    
#Smart Window
class SmartWindow(Device):
    air_purity = 0
    def __init__(self):
        try:
            super().__init__()
            self.air_purity = random.randint(MIN_VALUE,MAX_VALUE)
            self.turn_on()
        except ValueError as e:
            print(f"Oh no something went wrong  during device initialization: {e}")
        except Exception as e:
            print(f"An unexpected error occurred: {e}")

    def handle_events(self):
        num = random.randint(2,5)
        self.polluting_air(num)
        if self.get_mode() == "OFF" and self.get_air_purity() < 45:
            self.turn_on()
        
        while self.get_mode == "ON":
            self.letting_fresh_air_in(num)
            
            if self.get_air_purity() > 95:
                self.turn_off()

    def __str__(self):
        return f"Smart Window (ID:{self.device_id}): {self.mode.value}, air purity: {self.get_air_purity()}"

    def polluting_air(self,num):
        self.air_purity -= num
        if self.air_purity < 0:
            self.air_purity = 0

    def letting_fresh_air_in(self,num):
        self.air_purity += num
        if self.air_purity > 100:
            self.air_purity = 100

    def get_air_purity(self):
        return self.air_purity

#Coffee Machine
class CoffeeMachine(Device):
    order_recognized = False
    def __init__(self):
        super().__init__()
        self.turn_on()

    def handle_events(self):
        if self.get_mode() == "ON":
            num = random.randint(MIN_VALUE,MAX_VALUE)

            if num > 90:
                self.order_recognized = True
                self.send_feedback()
            
            if self.get_order_recognized() == True:
                self.order_recognized = False
            

    def __str__(self):
        return f"Coffee Machine (ID:{self.device_id}): {self.mode.value}, brewing: {self.get_order_recognized()}"
    
    def send_feedback(self):
        print("Your coffee is brewing!")
            
    def get_order_recognized(self):
        return self.order_recognized

# Console program
devices = []
quit = False

def simulate(devices):
    for device in devices:
        device.turn_on()
    
    for _ in range(10):
        time.sleep(1)
        for device in devices:
            device.handle_events()
            print(device.__str__())

def add_machine():
    machine_type = int(input("\nTypes:\n1: Smart lights\n2: Thermostat\n3: Security camera\n4: Robot vacuum\n5: Air purifier\nAdd the type of the machine(number): "))
    if machine_type > 0 and machine_type < 6:
        if machine_type == 1:
            d = SmartLights()
        elif machine_type == 2:
            d = Thermostat()
        elif machine_type == 3:
            d = SecurityCamera()
        elif machine_type == 4:
            d = SmartWindow()
        elif machine_type == 5:
            d = CoffeeMachine()
        devices.append(d)
    else:
        print("Error in process of creating, try again!\n")
    print("")

def print_machines():
    print("\nHere are your machines:\n")
    for device in devices:
        print(device.__str__())
    print("")

def option_choosing():
    print("To add a smart machine, press 1\nTo check all your deivces, press 2\nTo simulate 10 rounds, press 3\nTo close the application, press 4")
    answer = int(input("Option: "))

    if answer == 1:
        add_machine()

    elif answer == 2:
        print_machines()

    elif answer == 3:
        simulate(devices)

    elif answer == 4:
        global quit
        quit = True
        print("Thank you for using the product, good bye!")

    else:
        print("Not a right option type, try again!")


# GUI program

class HomeAutomationGUI:
    def __init__(self, root):
        self.root = root
        self.root.title("Home Automation System")

        self.devices = []

        self.add_device_button = tk.Button(root, text="Add Device", command=self.add_device)
        self.add_device_button.grid(row=0, column=1, columnspan=2)

        self.device_frame = tk.Frame(root)
        self.device_frame.grid(row=1, column=1, columnspan=2)

        self.device_listbox = tk.Listbox(self.device_frame)
        self.device_listbox.grid(row=1, column=1)

        self.status_label = tk.Label(self.device_frame, text="Device Status")
        self.status_label.grid(row=1, column=2)

        self.updating = False

        self.root.after(1000, self.update_all_device_statuses)

    def turn_on(self, device):
        device.turn_on()
        self.update_all_device_statuses()

    def turn_off(self, device):
        device.turn_off()
        self.update_all_device_statuses()

    def add_device(self):
        try:
            device_type = int(askstring("Device type", "Enter device type's number:\n1: Smart Lights\n2: Thermostat\n3: Security Camera\n4: Robot Vacuum\n5: Air purifier"))
            if device_type not in range(1,6):
                return
            if device_type:
                if device_type == 1:
                    device = SmartLights()
                    self.devices.append(device)
                    self.device_listbox.insert(tk.END, f"Smart Lights")

                    on_button = tk.Button(self.device_frame, text="Turn On", command=lambda dev=device: self.turn_on(dev))
                    off_button = tk.Button(self.device_frame, text="Turn Off", command=lambda dev=device: self.turn_off(dev))
                    row = len(self.devices) + 1
                    on_button.grid(row=row, column=0)
                    off_button.grid(row=row, column=1)

                elif device_type == 2:
                    device = Thermostat()
                    self.devices.append(device)
                    self.device_listbox.insert(tk.END, f"Thermostat")

                    on_button = tk.Button(self.device_frame, text="Turn On", command=lambda dev=device: self.turn_on(dev))
                    off_button = tk.Button(self.device_frame, text="Turn Off", command=lambda dev=device: self.turn_off(dev))
                    row = len(self.devices) + 1
                    on_button.grid(row=row, column=0)
                    off_button.grid(row=row, column=1)

                elif device_type == 3:
                    device = SecurityCamera()
                    self.devices.append(device)
                    self.device_listbox.insert(tk.END, f"Security Camera")

                    on_button = tk.Button(self.device_frame, text="Turn On", command=lambda dev=device: self.turn_on(dev))
                    off_button = tk.Button(self.device_frame, text="Turn Off", command=lambda dev=device: self.turn_off(dev))
                    row = len(self.devices) + 1
                    on_button.grid(row=row, column=0)
                    off_button.grid(row=row, column=1)

                elif device_type == 4:
                    device = SmartWindow()
                    self.devices.append(device)
                    self.device_listbox.insert(tk.END, f"Smart  Window")

                    on_button = tk.Button(self.device_frame, text="Turn On", command=lambda dev=device: self.turn_on(dev))
                    off_button = tk.Button(self.device_frame, text="Turn Off", command=lambda dev=device: self.turn_off(dev))
                    row = len(self.devices) + 1
                    on_button.grid(row=row, column=0)
                    off_button.grid(row=row, column=1)

                elif device_type == 5:
                    device = CoffeeMachine()
                    self.devices.append(device)
                    self.device_listbox.insert(tk.END, f"Coffee Machine")

                    on_button = tk.Button(self.device_frame, text="Turn On", command=lambda dev=device: self.turn_on(dev))
                    off_button = tk.Button(self.device_frame, text="Turn Off", command=lambda dev=device: self.turn_off(dev))
                    row = len(self.devices) + 1
                    on_button.grid(row=row, column=0)
                    off_button.grid(row=row, column=1)

                else:
                    self.add_device()
        except ValueError as e:
            print(f"An error occurred during device creation: {e}")
        except Exception as e:
            print(f"An unexpected error occurred: {e}")

    def update_all_device_statuses(self):
        if not self.updating:
            self.updating = True
            status_text = "Device Status:\n"
            try:
                for device in self.devices:
                    device.handle_events()
                    if isinstance(device, SmartLights):
                        status_text += f"{device.get_name()} - Status: {device.get_mode()}, Brightness: {device.get_brightness()}\n"
                    elif isinstance(device, Thermostat):
                        status_text += f"{device.get_name()} - Status: {device.get_mode()}, Temperature: {round(device.get_temperature(),2)}\n"
                    elif isinstance(device, SecurityCamera):
                        status_text += f"{device.get_name()} - Status: {device.get_mode()}, Motion: {device.get_motion_detected()}\n"
                    elif isinstance(device, SmartWindow):
                        status_text += f"{device.get_name()} - Status: {device.get_mode()}, Air Purity: {device.get_air_purity()}\n"
                    elif isinstance(device, CoffeeMachine):
                        status_text += f"{device.get_name()} - Status: {device.get_mode()}, Brewing: {device.get_order_recognized()}\n"
                self.status_label.config(text=status_text)
                self.updating = False
            except Exception as e:
                status_text += f"Error updating device status: {e}\n"
        self.root.after(1000, self.update_all_device_statuses)

root = tk.Tk()
root.geometry("400x350")
app = HomeAutomationGUI(root)
light = SmartLights()
print(light)

try:
    root.mainloop()
except Exception as e:
    print(f"An unexpected error occurred in the Tkinter mainloop: {e}")