function car = connectToCar()
%CONNECTTOCAR Summary of this function goes here
%   Detailed explanation goes here
%%SETUP
    %Create car
    car = Car;
    %'/car_1/right_front_wheel_velocity_controller/command'
    %'/car_1/left_front_wheel_velocity_controller/command'
    %Create ROS subscribers and publisher
    car.name = 'car_1';
    [car.pubRightSteering,car.msgRightSteering] = rospublisher('/car_1/right_steering_hinge_position_controller/command');
    [car.pubLeftSteering,car.msgLeftSteering] = rospublisher('/car_1/left_steering_hinge_position_controller/command');
    [car.pubRightRearWheelVelocity,car.msgRightRearWheelVelocity] = rospublisher('/car_1/right_rear_wheel_velocity_controller/command');
    [car.pubLeftRearWheelVelocity,car.msgLeftRearWheelVelocity] = rospublisher('/car_1/left_rear_wheel_velocity_controller/command');
    [car.pubRightFrontWheelVelocity,car.msgRightFrontWheelVelocity] = rospublisher('/car_1/right_front_wheel_velocity_controller/command');
    [car.pubLeftFrontWheelVelocity,car.msgLeftFrontWheelVelocity] = rospublisher('/car_1/left_front_wheel_velocity_controller/command');
    car.lidar = rossubscriber('/car_1/scan');
    car.subWheelVelocity = rossubscriber('/car_1/left_front_wheel_velocity_controller/command');
    car.subSteeringAngle = rossubscriber('/car_1/right_steering_hinge_position_controller/command');

end

