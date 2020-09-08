pragma solidity >=0.4.22 <0.6.0;

contract TopicVoting {
    struct Topic {
        string title;
        uint votes;
    }
    
    string name;
    address public owner;
    Topic[] public topics;
    
    constructor() public {
        owner = msg.sender;
        
        name = "Topic Voting Smart Contract";
    }
    
    function addTopic(string memory newTitle) public {
        require(msg.sender == owner);
        
        topics.push(Topic({title: newTitle, votes: 0}));
    }
    
    function addVote(uint topicIndex) public {
        topics[topicIndex].votes = topics[topicIndex].votes + 1;
    }
    
    function removeAllTopics() public {
        require(msg.sender == owner);
        
        topics.length = 0;
    }
    
    function getName() public view returns (string memory publicName) {
        return name;
    }
}
