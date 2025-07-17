from enum import Enum
from abc import ABC, abstractmethod
import random
import time
import tkinter as tk
from threading import Thread
from tkinter import *

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
    
    def toggle_status(self):
        if self.get_mode() == "ON":
            self.turn_off()
        else:
            self.turn_on()
    
    @abstractmethod
    def handle_events(self):
        pass

#Smart Lights
class SmartLight(Device):
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
        return f"Smart Light (ID:{self.device_id}) - {self.mode.value}, current brightness: {self.get_brightness()}"

    def get_brightness(self):
        return self.brightness
    
    def set_brightness(self, num):
        self.brightness = num

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
        return f"Thermostat (ID:{self.device_id}) - {self.mode.value}, current temperature: {self.get_temperature()}"

    def get_temperature(self):
        return self.temperature
    
    def set_temperature(self, value):
        self.temperature = value
        
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
                self.detect_motion()
                self.send_alarm()

    def __str__(self):
        return f"Security Camera (ID:{self.device_id}) - {self.mode.value}, motion: {self.get_motion_detected()}"
    
    def send_alarm(self):
        print("Movement has been detected!")
            
    def get_motion_detected(self):
        return self.motion_detected
    
    def detect_motion(self):
        self.motion_detected = True
    
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
        return f"Smart Window (ID:{self.device_id}) - {self.mode.value}, air purity: {self.get_air_purity()}"

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
    
    def set_purity(self, num):
        self.air_purity = num

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
                self.recognize_order()
                self.send_feedback()
            

    def __str__(self):
        return f"Coffee Machine (ID:{self.device_id}): {self.mode.value}, brewing: {self.get_order_recognized()}"
    
    def send_feedback(self):
        print("Your coffee is brewing!")
            
    def get_order_recognized(self):
        return self.order_recognized
    
    def recognize_order(self):
        self.order_recognized = True

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

# Automation System
class AutomationSystem:
    def __init__(self):
        self.devices = []

    def add_device(self, device):
        self.devices.append(device)

# GUI program
class IoTGUI:
    def __init__(self, root, system:AutomationSystem):
        self.root = root
        self.system = system
        self.root.title("Smart Home IoT Simulator by RDDZXA")
        self.labels = []
        self.automation_on = False

        self.device_listbox = tk.Listbox(root, width=50)
        self.device_listbox.pack()

        #self.create_automation_control()
        self.create_device_controls()

        self.update_device_list()
        self.update_thread = Thread(target=self.simulation_loop)
        self.update_thread.daemon = True
        self.update_thread.start()

    '''
    def create_automation_control(self):
        label = tk.Label(self.root, text=f"Automation currently {'ON' if self.automation_on else 'OFF'}")
        label.pack()
        random_button = tk.Button(self.root, text="Toggle Random", command=self.toggle_random())
        random_button.pack()

    def toggle_random(self):
        self.automation_on = not self.automation_on
    '''

    def create_device_controls(self):
        for i, device in enumerate(self.system.devices):
            if isinstance(device, SmartLight):
                self.create_light_controls(device)
                var_str = tk.StringVar()
                var_str.set(device)
                tmp_label = tk.Label(self.root, textvariable=var_str)
                self.labels.append({
                    'id': device.device_id,
                    'label': var_str,
                    'device': device
                })
                tk.Button(self.root, text="Toggle ON/OFF", command=lambda device=device: self.toggle_helper(device)).pack()
                tmp_label.pack()
            elif isinstance(device, Thermostat):
                self.create_thermostat_controls(device)
                var_str = tk.StringVar()
                var_str.set(device)
                tmp_label = tk.Label(self.root, textvariable=var_str)
                self.labels.append({
                    'id': device.device_id,
                    'label': var_str,
                    'device': device
                })
                tk.Button(self.root, text="Toggle ON/OFF", command=lambda device=device: self.toggle_helper(device)).pack()
                tmp_label.pack()
            elif isinstance(device, SecurityCamera):
                self.create_camera_controls(device)
                var_str = tk.StringVar()
                var_str.set(device)
                tmp_label = tk.Label(self.root, textvariable=var_str)
                self.labels.append({
                    'id': device.device_id,
                    'label': var_str,
                    'device': device
                })
                tk.Button(self.root, text="Toggle ON/OFF", command=lambda device=device: self.toggle_helper(device)).pack()
                tmp_label.pack()
            elif isinstance(device, CoffeeMachine):
                self.create_coffee_controls(device)
                var_str = tk.StringVar()
                var_str.set(device)
                tmp_label = tk.Label(self.root, textvariable=var_str)
                self.labels.append({
                    'id': device.device_id,
                    'label': var_str,
                    'device': device
                })
                tk.Button(self.root, text="Toggle ON/OFF", command=lambda device=device: self.toggle_helper(device)).pack()
                tmp_label.pack()
            elif isinstance(device, SmartWindow):
                self.create_window_controls(device)
                var_str = tk.StringVar()
                var_str.set(device)
                tmp_label = tk.Label(self.root, textvariable=var_str)
                self.labels.append({
                    'id': device.device_id,
                    'label': var_str,
                    'device': device
                })
                tk.Button(self.root, text="Toggle OPEN/CLOSE", command=lambda device=device: self.toggle_helper(device)).pack()
                tmp_label.pack()

    def toggle_helper(self, device:Device):
        device.toggle_status()

    def create_light_controls(self, light:SmartLight):
        # Create controls for a smart light
        label = tk.Label(self.root, text=f"{light.__class__.__name__} | Brightness")
        label.pack()
        brightness_slider = tk.Scale(self.root, from_=MIN_VALUE, to=MAX_VALUE, orient="horizontal", command=lambda value, light=light: self.set_brightness(light, value))
        brightness_slider.pack()

    def create_thermostat_controls(self, thermostat:Thermostat):
        # Create controls for a thermostat
        label = tk.Label(self.root, text=f"{thermostat.__class__.__name__} | Temperature")
        label.pack()
        temperature_slider = tk.Scale(self.root, from_=15, to=30, orient="horizontal", command=lambda value, thermostat=thermostat: self.set_temperature(thermostat, value))
        temperature_slider.pack()

    def create_camera_controls(self, camera:SecurityCamera):
        # Create controls for a security camera
        label = tk.Label(self.root, text=f"{camera.__class__.__name__} | Motion Detection")
        label.pack()
        motion_button = tk.Button(self.root, text="Random Detect Motion", command=lambda camera=camera: self.detect_motion(camera))
        motion_button.pack()
        
    def create_coffee_controls(self, coffee:CoffeeMachine):
        # Create controls for a coffee machine
        label = tk.Label(self.root, text=f"{coffee.__class__.__name__} | Voice Order Recognition")
        label.pack()
        order_button = tk.Button(self.root, text="Random Order Recognition", command=lambda coffee=coffee: self.recognize_order(coffee))
        order_button.pack()
        
    def create_window_controls(self, window:SmartWindow):
        # Create controls for a smart window
        label = tk.Label(self.root, text=f"{window.__class__.__name__} | Air Purity")
        label.pack()
        brightness_slider2 = tk.Scale(self.root, from_=MIN_VALUE, to=MAX_VALUE, orient="horizontal", command=lambda value, window=window: self.set_purity(window, value))
        brightness_slider2.pack()

    def set_brightness(self, light:SmartLight, brightness):
        light.set_brightness(int(brightness))

    def set_temperature(self, thermostat:Thermostat, temperature):
        thermostat.set_temperature(int(temperature))

    def detect_motion(self, camera:SecurityCamera):
        camera.detect_motion()

    def recognize_order(self, coffee:CoffeeMachine):
        coffee.recognize_order()

    def set_purity(self, window:SmartWindow, purity):
        window.set_purity(int(purity))
    
    def update_values(self):
        for tmp_label in self.labels:
            device = tmp_label['device']
            tmp_label['label'].set(device)

    def update_device_list(self):
        self.device_listbox.delete(0, tk.END)
        for device in self.system.devices:
            self.device_listbox.insert(tk.END, device)

    def simulation_loop(self):
        while True:
            if self.automation_on:
                simulate()
            self.update_values()
            self.update_device_list()
            time.sleep(1)

root = tk.Tk()
automation_system = AutomationSystem()

automation_system.add_device(SmartLight())
automation_system.add_device(Thermostat())
automation_system.add_device(SecurityCamera())
automation_system.add_device(CoffeeMachine())
automation_system.add_device(SmartWindow())

app = IoTGUI(root, automation_system)

try:
    root.mainloop()
except Exception as e:
    print(f"An unexpected error occurred in the Tkinter mainloop: {e}")