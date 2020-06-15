//
//  NewsViewModelFactory.swift
//  homeWork_1
//
//  Created by Пазин Даниил on 14.06.2020.
//  Copyright © 2020 Марат Нургалиев. All rights reserved.
//

import UIKit
import SDWebImage

final class NewsViewModelFactory {
    
    func constructViewModels(from feed: [VkFeed]) -> [NewsViewModel] {
        return feed.compactMap(self.viewModel)
    }
    
    private func viewModel(from feed: VkFeed) -> NewsViewModel {
        let labelDate = feed.getFeedDate()
        let labelFeedGroupHeader = feed.sourceName

        
        
        let labelText = feed.feedText
        let labelLike = feed.getStringFrom(count: feed.countLikes)
        let labelViews = feed.getStringFrom(count: feed.countViews)
        let labelShare = feed.getStringFrom(count: feed.countReposts)
        let labelComment = feed.getStringFrom(count: feed.countComments)
        
        let imageViewGroup = UIImageView.init()
        imageViewGroup.sd_setImage(with: URL(string: feed.sourceUrl), placeholderImage: UIImage(named: "noPhoto"))
        
        let imageNew = UIImageView.init()
        
        if feed.attachments.count > 0 {
            
            let height = UIScreen.main.bounds.size.width * CGFloat(feed.attachments[0].height) / CGFloat(feed.attachments[0].width)
            
            imageNew.pin.height(height)
            
            imageNew.sd_setImage(with: URL(string: feed.attachments[0].imageUrl), placeholderImage: UIImage(named: "noPhoto"))
            
        } else {
            imageNew.pin.height(0)
        }
        
        return NewsViewModel(labelDate: labelDate, labelFeedGroupHeader: labelFeedGroupHeader, labelText: labelText, labelLike: labelLike, labelViews: labelViews, labelShare: labelShare, labelComment: labelComment, imageViewGroup: imageViewGroup, imageNew: imageNew)
    }
        
}
        
        
//        let weatherText = String(Int(round(weather.temperature)))
//        let dateText = WeatherViewModelFactory.dateFormatter.string(from: weather.date)
//        let iconImage = UIImage(named: weather.weatherIconName)
//        let colorTone = min(abs(weather.temperature) * 10, 255.0)
//        let shadowColor: UIColor
//        if weather.temperature <= 0 {
//            shadowColor = UIColor.rgba(0.0, 50.0, CGFloat(colorTone), a: 1.0)
//        } else {
//            shadowColor = UIColor.rgba(CGFloat(colorTone), 0.0, 0.0, a: 1.0)
//        }
//        return WeatherViewModel(weatherText: weatherText, dateText: dateText, iconImage: iconImage, shadowColor: shadowColor)
//    }
//
//    private static let dateFormatter: DateFormatter = {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd.MM.yyyy HH.mm"
//        return dateFormatter
//    }()
//}

//func configure(feed: VkFeed) {
//
//    labelDate.text = feed.getFeedDate()
//    labelFeedGroupHeader.text = feed.sourceName
//
//    if feed.feedText.count == 0 {
//        labelText.pin.height(0)
//    } else {
//        labelText.pin.height(70)
//    }
//
//    labelText.text = feed.feedText
//    labelLike.text = feed.getStringFrom(count: feed.countLikes)
//    labelViews.text = feed.getStringFrom(count: feed.countViews)
//    labelShare.text = feed.getStringFrom(count: feed.countReposts)
//    labelComment.text = feed.getStringFrom(count: feed.countComments)
//
//    imageViewGroup.sd_setImage(with: URL(string: feed.sourceUrl), placeholderImage: UIImage(named: "noPhoto"))
//
//    if feed.attachments.count > 0 {
//
//        let height = self.frame.width * CGFloat(feed.attachments[0].height) / CGFloat(feed.attachments[0].width)
//
//        imageNew.pin.height(height)
//
//        imageNew.sd_setImage(with: URL(string: feed.attachments[0].imageUrl), placeholderImage: UIImage(named: "noPhoto"))
//
//    } else {
//        imageNew.pin.height(0)
//    }
//
//    setNeedsLayout()
//    layoutIfNeeded()
//}
