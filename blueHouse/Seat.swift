//
//  Seat.swift
//  blueHouse
//
//  Created by Samantha Yang on 2/17/19.
//  Copyright © 2019 theswiftproject. All rights reserved.
//

import Foundation


//class的implementation

class Seat {
    var timer = Timer()
    var tempLeaving = 0
    var occupied = 0
    var ownerUID = "000000000";    //This is a string instead of an int because it may starts with 0
    var renewed = 0
    
    func makeTimer() {
        //创建计时器
        timer = Timer.scheduledTimer(timeInterval: 7200, target: self, selector: #selector(releaseS),userInfo: nil, repeats: false)
    }
    
    func checkTempLeaving() -> Bool {
        //检查这个座位的主人是否暂时离开了
        var test = false
        if tempLeaving == 1 {
            test = true
        }
        return test
    }
    
    func checkIsOccupied() -> Bool {
        //检查这个座位是否有人占用
        var test = false
        if occupied == 1 {
            test = true
        }
        return test
    }
    
    func startReservation(UID: String) {
        //Someone has chosen this seat
        if occupied == 1
        {
            print("Invalid request")
        }
        makeTimer()
        ownerUID = UID
        occupied = 1
    }
    
    func TemperaryLeaving(UID: String) {
        //Someone wants to leave temperarily
        if occupied == 1 && UID == ownerUID{
            tempLeaving = 1;
        }
        else
        {
            print("Invalid request")
        }
    }
    
    func backFromLeaving(UID: String) {
        //Someone has been back from temperary leaving
        if occupied == 0 || UID != ownerUID || tempLeaving == 0{
            print("Invalid request")
        }
        else
        {
            tempLeaving = 0
        }
    }
    
    func renew(UID: String) {
        //Someone wants to renew his seat
        if occupied == 0 || UID != ownerUID || tempLeaving == 1 {
            print("Invalid request")
        }
        else if renewed == 1{
            print("You can only renew once")
        }
        else {
            timer.invalidate()
            makeTimer()
            renewed = 1
        }
    }
    
    
    @objc func releaseS() {
        //Release this seat
        occupied = 0
        ownerUID = "000000000"
        tempLeaving = 0
        timer.invalidate()
        renewed = 0
    }
    
    func signout(UID: String) {
        if occupied == 0 || UID != ownerUID || tempLeaving == 1 {
            print("Invalid request")
        }
        else{
            releaseS()
        }
    }
    
}
