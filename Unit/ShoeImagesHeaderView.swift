//
//  ShoeImagesHeaderViewController.swift
//  Unit
//
//  Created by Siham Hadi on 3/10/18.
//  Copyright © 2018 Unit All rights reserved.
//



import UIKit

class ShoeImagesHeaderView: UIView
{
    @IBOutlet weak var pageControl: UIPageControl!
}

extension ShoeImagesHeaderView : ShoeImagesPageViewControllerDelegate
{
    func setupPageController(numberOfPages: Int)
    {
        pageControl.numberOfPages = numberOfPages
    }
    
    func turnPageController(to index: Int)
    {
        pageControl.currentPage = index
    }
}











