import Foundation

class SocketManager {
    let host: String
    let port: Int
    var inputStream: InputStream!
    var outputStream: OutputStream!

    init(host: String, port: Int) {
        self.host = host
        self.port = port
    }

    func connect() {
        Stream.getStreamsToHost(withName: host, port: port, inputStream: &inputStream, outputStream: &outputStream)
        
        inputStream.delegate = self
        outputStream.delegate = self
        
        inputStream.schedule(in: .current, forMode: .common)
        outputStream.schedule(in: .current, forMode: .common)
        
        inputStream.open()
        outputStream.open()
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
        if aStream == inputStream {
            switch eventCode {
            case .hasBytesAvailable:
                var buffer = [UInt8](repeating: 0, count: 1024)
                let bytesRead = inputStream.read(&buffer, maxLength: buffer.count)
                if bytesRead > 0 {
                    let receivedMessage = String(bytes: buffer.prefix(bytesRead), encoding: .utf8)
                    print("Received message: \(receivedMessage!)")
                }
            default:
                break
            }
        }
    }
}