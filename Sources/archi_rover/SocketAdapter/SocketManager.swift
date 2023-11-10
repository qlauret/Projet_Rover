import Foundation

class SocketManager: NSObject {
    let host: String
    let port: UInt32
    var inputStream: InputStream!
    var outputStream: OutputStream!

    init(host: String, port: UInt32) {
        self.host = host
        self.port = port
    }

    func connect() {
        if let url = URL(string: "http://\(self.host):\(self.port)") {
            inputStream = try? InputStream(url: url)
            outputStream = try? OutputStream(url: url, append: false)
            
            inputStream.delegate = self
            outputStream.delegate = self
            
            inputStream.schedule(in: .current, forMode: .default)
            outputStream.schedule(in: .current, forMode: .default)
            
            inputStream.open()
            outputStream.open()
        } else {
            print("Erreur lors de la création des streams.")
        }
    }

    func disconnect() {
        inputStream.close()
        outputStream.close()
    }

    func sendMessage(message: String) {
        let data = message.data(using: .utf8)!
        _ = data.withUnsafeBytes { outputStream.write($0, maxLength: data.count) }
    }

    func readMessage() -> String? {
        var buffer = [UInt8](repeating: 0, count: 1024)
        let bytesRead = inputStream.read(&buffer, maxLength: buffer.count)
        if bytesRead > 0 {
            let receivedMessage = String(bytes: buffer.prefix(bytesRead), encoding: .utf8)
            return receivedMessage
        }
        return nil
    }
}

extension SocketManager: StreamDelegate {
    func stream(_ aStream: Stream, handle eventCode: Stream.Event) {
        switch eventCode {
        case .hasBytesAvailable:
            if let inputStream = aStream as? InputStream {
                var buffer = [UInt8](repeating: 0, count: 1024)
                let bytesRead = inputStream.read(&buffer, maxLength: buffer.count)
                if bytesRead > 0 {
                    let receivedMessage = String(bytes: buffer.prefix(bytesRead), encoding: .utf8)
                    print("Received message: \(receivedMessage!)")
                }
            }
        default:
            break
        }
    }
}