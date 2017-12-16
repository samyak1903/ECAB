package com.pack;

public class Car {
    private String vehicleNumber;
    private String vehicleType;
    private String model;
    private int seatingCapacity;
    private int ac;
    private int musicSystem;
    private double fixedCharge;
    private double fare;
    private String photo;

    public Car() {
    }

    public Car(String vehicleNumber, String vehicleType, String model, int seatingCapacity, int ac, int musicSystem, double fixedCharge, double fare, String photo) {
        this.vehicleNumber = vehicleNumber;
        this.vehicleType = vehicleType;
        this.model = model;
        this.seatingCapacity = seatingCapacity;
        this.ac = ac;
        this.musicSystem = musicSystem;
        this.fixedCharge = fixedCharge;
        this.fare = fare;
        this.photo = photo;
    }

    public String getVehicleNumber() {
        return vehicleNumber;
    }

    public void setVehicleNumber(String vehicleNumber) {
        this.vehicleNumber = vehicleNumber;
    }

    public String getVehicleType() {
        return vehicleType;
    }

    public void setVehicleType(String vehicleType) {
        this.vehicleType = vehicleType;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public int getSeatingCapacity() {
        return seatingCapacity;
    }

    public void setSeatingCapacity(int seatingCapacity) {
        this.seatingCapacity = seatingCapacity;
    }

    public int getAc() {
        return ac;
    }

    public void setAc(int ac) {
        this.ac = ac;
    }

    public int getMusicSystem() {
        return musicSystem;
    }

    public void setMusicSystem(int musicSystem) {
        this.musicSystem = musicSystem;
    }

    public double getFixedCharge() {
        return fixedCharge;
    }

    public void setFixedCharge(double fixedCharge) {
        this.fixedCharge = fixedCharge;
    }

    public double getFare() {
        return fare;
    }

    public void setFare(double fare) {
        this.fare = fare;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }


}
