//
//  NewsArchiveMockData.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 17.07.2021.
//

import Foundation

class NewsMock{
    
    func mock() -> NewsArchiveModel {
       return NewsArchiveModel(
                        title: "Watch 1,000 illegal bitcoin PCs get literally steamrolled, experience justice",
                        link: "https://www.pcgamer.com/watch-1000-illegal-bitcoin-pcs-get-literally-steamrolled-experience-justice",
                        keywords: ["Btc","coin","crypto","new","cardano","crime"],
                        creator: ["Jorge Jimenez"],
                        videoURL: "https://",
                        description: "These bad computers did the crime, and now they'll do the time: death, after being steamrolled by the Malaysian government",
                        content: "According to Malaysian paper The Star (via The Block), eight people in Miri, Malaysia were charged for allegedly stealing electricity to power a massive bitcoin mining operation involving 1,069 PCs. Malaysia has recently started cracking down on countrywide electricity theft used for illegal bitcoin mining operations. The PCs were confiscated during six raids on properties near an airport in the Sarawak region. The raids were conducted in a joint operation between Malaysian authorities and Sarawak Energy Berhad (SEB). These suspects allegedly found a way to siphon electricity from SEB power lines to power the bitcoin mining machines, stealing nearly $2 million worth of electricity over three months. The PCs were cleared for disposal today, which explains the video above. Why was a steam roller chosen? We will never know. Flattening a group of criminal computers with a steam roller seems like a pretty fun way to administer justice. Blowing them up with a stick of dynamite is a close second. Although one wonders why not just auction off or find a way to repurpose the PCs?Illegal bitcoin mining isn't anything new in Malaysia. Back in March, a man was accused of stealing over $2.2 million worth of electricity from the Tenaga Nasional Berhad energy company. He is still on the run and wanted by the police. Mining cryptocurrency on this large of a scale requires an awful lot of power, which is an expensive investment, so electricity theft is on the rise throughout the world. An upcoming legal bitcoin mining operation in the US will rely on a nuclear power plant.\"The electricity theft for mining bitcoin activities has caused frequent power outages and in 2021, three houses were razed (because of electrical fires) due to illegal electricity supply connections,\" said Miri police chief ACP Hakemal Hawari to The Star. Currently, the Miri police are working on ways to increase the detection of illegal wire connections for bitcoin mining activities. \"A total of six people have been successfully charged under Section 379 of the Penal Code for electricity theft and have been fined up to RM8,000 and jailed for up to eight months.",
                        pubDate: "2021-07-16 20:42:50",
                        imageURL: "https://cdn.mos.cms.futurecdn.net/eA335QrvuwLzSPE9DgAo5g.png",
                        sourceID: "pcgamer")
    }
    
}
