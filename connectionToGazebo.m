function [] = connectionToGazebo()
%CONNECTIONTOGAZEBO Summary of this function goes here
%   Detailed explanation goes here
%Connect to ROS
rosshutdown;
gazeboIp = "http://192.168.209.129:11311";
rosinit(gazeboIp);
end

