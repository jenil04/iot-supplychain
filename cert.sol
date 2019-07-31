pragma solidity ^0.4.22;

contract Certificate {
    
    struct iotCert {
        // Owner's address.
        address owner;

        // Certificate metadata
        string RFID;
        uint   DeviceID;
        string firmwareVersion;
        string signature;

        // date when the certificate was assigned.
        uint issue_date;
        
        // data stored in the IoT device.
        string data;
    }
    
    iotCert[] public iotCertificates;

    /**
    * @dev Constructor sets the original `owner` of the contract to the sender account, and
    * commits the certificate details to the blockchain
    */
    function issueCert(uint id, address _owner, string _RFID, uint _DeviceID, 
    string _firmwareVersion, uint _issue_date, string _data, string _signature) public {
        
        // Setting the amount of certificates for testing.
        iotCertificates.length = 100;
        
        // 
        iotCertificates[id].owner = _owner;
        iotCertificates[id].RFID = _RFID;
        iotCertificates[id].DeviceID = _DeviceID;
        iotCertificates[id].firmwareVersion = _firmwareVersion;
        iotCertificates[id].issue_date = _issue_date;
        iotCertificates[id].data = _data;
        iotCertificates[id].signature = _signature;
    }

    /**
    * @dev returns contract metadata in one function call, rather than separate .call()s
    */
    function verifyCertificateDetails(uint id, address _owner, uint _DeviceID) public returns (
        address, string, uint, string, uint, string, string) {
        // Verifying owner's identity and device number to grant 
        // access to the data.
        require(_owner == iotCertificates[id].owner 
        && _DeviceID == iotCertificates[id].DeviceID);
        
            return (
            iotCertificates[id].owner,
            iotCertificates[id].DeviceID,
            iotCertificates[id].firmwareVersion,
            iotCertificates[id].issue_date,
            iotCertificates[id].data,
            iotCertificates[id].signature
            );
        
    }
    
}
