//
//  SceneDelegate.swift
//  githubFollowersApp
//
//  Created by deniz on 26.03.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createTabBarController()
        window?.makeKeyAndVisible()
        
        configureNavigationBar()
        
    }
    
    //MARK: SEARCH Navigation
    func createSearchNC()->UINavigationController{
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    //MARK: FAVORITELIST Navigation
    func createFavoriteListNC()->UINavigationController{
        let favoriteListVC = FavoriteListVC()
        favoriteListVC.title = "Favorites"
        favoriteListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favoriteListVC)
    }
    
    //MARK: Setup TabBarController
    func createTabBarController()->UITabBarController{
        let tabbar = UITabBarController()
        tabbar.viewControllers = [createSearchNC(),createFavoriteListNC()]
        configureTabBar()
       
        return tabbar
    }
    
    //MARK: Settings Navigation
    func configureNavigationBar(){
        let nav = UINavigationBar.appearance()
        nav.tintColor = .systemGreen
    }
    
    //MARK: Settings TabBar
    func configureTabBar(){
        let tab = UITabBar.appearance()
        tab.tintColor = .systemGreen
        tab.isTranslucent = false
        
    }
}

