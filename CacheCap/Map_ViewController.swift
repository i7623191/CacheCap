//
//  ViewController.swift
//  CacheCap
//
//  Created by David on 14/12/2015.
//  Copyright © 2015 David. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class Map_ViewController: UIViewController
{
    
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var myText: UITextView!
    
    @IBOutlet weak var mapToggle: UISwitch!
    let locationManager = CLLocationManager()
    
    var isShowing = false
    var hasShownCloseAlert = false
    
    @IBAction func SwitchPressed(sender: AnyObject) {
        
        
        if mapToggle.on{
                    mapView.mapType = .Satellite
                        } else {
                    mapView.mapType = .Standard
            }
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let background = CAGradientLayer().turquoiseColor()
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, atIndex: 0)
        
        mapView.setUserTrackingMode(.Follow, animated: true)
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        
        self.locationManager.startUpdatingLocation()
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2DMake(50.716404, -1.874935)
        mapView.addAnnotation(annotation)
        
        let bournemouthPier = CLLocationCoordinate2D(latitude: 50.716098, longitude: -1.875780)
        let bournemouthPierRegion = CLCircularRegion(center: bournemouthPier, radius: 10000, identifier: "bournemouth")
        locationManager.startMonitoringForRegion(bournemouthPierRegion)
        
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: Selector("downSwiped"))
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)

        
        
    }
    
    
}

extension Map_ViewController: CLLocationManagerDelegate {
    
    
        func downSwiped()
        {
            myText.hidden = true
            //print("down swiped")
        }


    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        mapView.showAnnotations(mapView.annotations, animated: true)
        
        let newLocation = locations.last
        
        if let newLocation = newLocation {
            if newLocation.distanceFromLocation(CLLocation(latitude:50.716404, longitude:-1.874935)) < 15 && !hasShownCloseAlert {
                hasShownCloseAlert = true
             
                
                if !isShowing {
                    isShowing = true
                    let refreshAlert = UIAlertController(title: "Geocache Reached", message: "You have reached the Geocache ", preferredStyle: UIAlertControllerStyle.Alert)
                    
                    refreshAlert.addAction(UIAlertAction(title: "View Cache Contents", style: .Default, handler: { _ in
                        self.performSegueWithIdentifier("slideShow", sender: self)
            
                        refreshAlert.dismissViewControllerAnimated(true, completion: nil)
                        self.isShowing = false
                    }))
                    
                    presentViewController(refreshAlert, animated: true, completion: nil)
                }
                

            }
        }
        
    }
    
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        
        
        if !isShowing {
            isShowing = true

            let refreshAlert = UIAlertController(title: "GeoCache Found", message: "You have entered a Geofence containing the Geocache", preferredStyle: UIAlertControllerStyle.Alert)
        
        
            refreshAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction!) in
            
            refreshAlert .dismissViewControllerAnimated(true, completion: nil)
            self.isShowing = false
            
        }))
            
       
        presentViewController(refreshAlert, animated: true, completion: nil)
                }

    
    func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
        //This code was removed as I deemed it not to be required.  It alerted the user they had left the location.
//       
//        if !isShowing {
//            isShowing = true
//            let refreshAlert = UIAlertController(title: "Geocache Lost", message: "You have left the GeoFence containg the Geocache ", preferredStyle: UIAlertControllerStyle.Alert)
//            
//            
//            refreshAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction!) in
//                
//                refreshAlert.dismissViewControllerAnimated(true, completion: nil)
//                self.isShowing = false
//                
//
//            }))
//            
//            presentViewController(refreshAlert, animated: true, completion: nil)
//        }
        
        
        
    }
    
    }
}