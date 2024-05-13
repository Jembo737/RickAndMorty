// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation

public protocol ApiClientProtocol {
    func fetchData<T>(with url: String) async throws -> T where T: Decodable
    func fetchData(with url: String) async throws -> Data
    func basicURL() -> String
    func fetchMoreData<T>(for page: Int) async throws -> T where T: Decodable
}

public struct ApiClient: ApiClientProtocol {
    public init() { }
    
    private var urlSession: URLSession = {
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration)
        return session
    }()
    
    private let urlString: String = "https://rickandmortyapi.com/api/character"
    
    private func decode<T: Decodable>(_ data: Data) throws -> T  {
        // Decode the data using JSONDecoder
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(T.self, from: data)
            return result
        } catch {
            throw error
        }
    }
    
    public func fetchData<T>(with url: String) async throws -> T where T: Decodable {
        let data = try await fetchData(with: url)
        let result: T = try decode(data)
        return result
    }
    
    public func fetchData(with url: String) async throws -> Data {
        guard let url = URL(string: url) else {
            throw NSError(domain: "APIError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
        }
        
        let (data, response) = try await urlSession.data(for: URLRequest(url: url))
        
        // Check the HTTP response
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NSError(domain: "APIError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid response"])
        }
        
        return data
    }
    
    public func fetchMoreData<T>(for page: Int) async throws -> T where T: Decodable {
        let url = "https://rickandmortyapi.com/api/character/?page=\(page)"
        
        let data = try await fetchData(with: url)
        let result: T = try decode(data)
        return result
    }
    
    public func basicURL() -> String {
        urlString
    }
}
