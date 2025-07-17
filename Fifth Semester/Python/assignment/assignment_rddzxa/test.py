import unittest
from unittest.mock import patch
from assignment_rddzxa import SmartLight, Thermostat, SecurityCamera, SmartWindow, CoffeeMachine        

class TestSmartLight(unittest.TestCase):
    def test_smart_light_get_brightness(self):
        smart_light = SmartLight()
        self.assertTrue(0 <= smart_light.get_brightness() <= 100)

    def test_smart_light_set_brightness(self):
        smart_light = SmartLight()
        smart_light.set_brightness(66)
        self.assertTrue(smart_light.get_brightness(), 66)

    def test_smart_light_turn_on(self):
        smart_light = SmartLight()
        smart_light.turn_on()
        self.assertTrue(smart_light.get_mode(),"ON")

    def test_smart_light_turn_off(self):
        smart_light = SmartLight()
        smart_light.turn_off()
        self.assertTrue(smart_light.get_mode(),"OFF")

class TestThermostat(unittest.TestCase):
    def test_thermostat_get_temperature(self):
        thermostat = Thermostat()
        self.assertTrue(10 <= thermostat.get_temperature() <= 20)

    def test_thermostat_set_temperature(self):
        thermostat = Thermostat()
        thermostat.set_temperature(23)
        self.assertTrue(thermostat.get_temperature(), 23)

    def test_thermostat_turn_on(self):
        thermostat = Thermostat()
        thermostat.turn_on()
        self.assertTrue(thermostat.get_mode(),"ON")

    def test_thermostat_turn_off(self):
        thermostat = Thermostat()
        thermostat.turn_off()
        self.assertTrue(thermostat.get_mode(),"OFF")

class TestSecurityCamera(unittest.TestCase):
    @patch('random.randint', return_value=91)
    def test_security_camera_get_motion_detected(self, mock_randint):
        security_camera = SecurityCamera()
        security_camera.handle_events()
        self.assertTrue(security_camera.get_motion_detected())

    def test_security_camera_detect_motion(self):
        security_camera = SecurityCamera()
        security_camera.detect_motion()
        self.assertTrue(security_camera.get_motion_detected())

    def test_security_camera_turn_on(self):
        security_camera = SecurityCamera()
        security_camera.turn_on()
        self.assertTrue(security_camera.get_mode(),"ON")

    def test_security_camera_turn_off(self):
        security_camera = SecurityCamera()
        security_camera.turn_off()
        self.assertTrue(security_camera.get_mode(),"OFF")

class TestSmartWindow(unittest.TestCase):
    def test_smart_window_get_air_purity(self):
        smart_window = SmartWindow()
        self.assertTrue(0 <= smart_window.get_air_purity() <= 100)

    def test_smart_window_set_air_purity(self):
        smart_window = SmartWindow()
        smart_window.set_purity(70)
        self.assertTrue(smart_window.get_air_purity(), 70)

    def test_smart_window_letting_fresh_air_in(self):
        smart_window = SmartWindow()
        smart_window.air_purity = 50
        smart_window.letting_fresh_air_in(5)
        self.assertEqual(smart_window.get_air_purity(),55)

    def test_smart_window_polluting_air(self):
        smart_window = SmartWindow()
        smart_window.air_purity = 50
        smart_window.polluting_air(5)
        self.assertEqual(smart_window.get_air_purity(),45)

    def test_smart_window_turn_on(self):
        smart_window = SmartWindow()
        smart_window.turn_on()
        self.assertTrue(smart_window.get_mode(),"ON")

    def test_smart_window_turn_off(self):
        smart_window = SmartWindow()
        smart_window.turn_off()
        self.assertTrue(smart_window.get_mode(),"OFF")

class TestCoffeeMachine(unittest.TestCase):
    @patch('random.randint', return_value=91)
    def test_coffee_machine_order_recognized(self, mock_randint):
        coffe_machine = CoffeeMachine()
        coffe_machine.handle_events()
        self.assertTrue(coffe_machine.get_order_recognized())

    def test_coffee_machine_recognize_order(self):
        coffe_machine = CoffeeMachine()
        coffe_machine.recognize_order()
        self.assertTrue(coffe_machine.get_order_recognized())

    def test_security_camera_turn_on(self):
        coffe_machine = CoffeeMachine()
        coffe_machine.turn_on()
        self.assertTrue(coffe_machine.get_mode(),"ON")

    def test_security_camera_turn_off(self):
        coffe_machine = CoffeeMachine()
        coffe_machine.turn_off()
        self.assertTrue(coffe_machine.get_mode(),"OFF")

if __name__ == '__main__':
    unittest.main()