contract ImpossibleGuessingGame {

    function hash(string memory _text, address _address) public pure returns(bytes32){
        return keccak256(abi.encodePacked(_text,_num,_address));

    }
}