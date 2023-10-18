// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "./Campaign.sol";

contract CampaignFactory {
    //Events
    event NewCampaignCreated(
        string title,
        string description,
        string imageUrl,
        string matadataUri,
        uint256 totalSupply,
        address indexed creator,
        address indexed contractAddress
    );

    address[] public deployedCampaigns;

    //Function to Create a Campaign
    function createCampaign(
        string memory title,
        string memory description,
        string memory imageUrl,
        string memory matadataUri,
        uint256 totalSupply
    ) public {
        address newCampaignAddress = address(
            new Campaign(
                title,
                description,
                imageUrl,
                matadataUri,
                totalSupply,
                msg.sender
            )
        );
        deployedCampaigns.push(newCampaignAddress);
        emit NewCampaignCreated(
            title,
            description,
            imageUrl,
            matadataUri,
            totalSupply,
            msg.sender,
            newCampaignAddress
        );
    }

    //Returns all the Deployed Campaigns Address
    function getDeployedCampaigns() public view returns (address[] memory) {
        return deployedCampaigns;
    }
}
