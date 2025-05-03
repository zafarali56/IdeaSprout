//
//  imageUploader.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 01/05/2025.
//

import Foundation
import UIKit



struct ImageUploader {

	static func uploadCreatePinImage(_ image: UIImage) async throws -> String? {
		// 1. Get Image Data
		guard let imageData = image.jpegData(compressionQuality: 0.25) else { return nil }

		// 2. Cloudinary Credentials (Placeholders - must be filled in)
		let cloudName = "dv0c3jrmz" 
		let uploadPreset = "pinterest"

		// 3. Construct URL
		let urlString = "https://api.cloudinary.com/v1_1/\(cloudName)/image/upload"
		guard let url = URL(string: urlString) else { return nil }

		// 4. Create URLRequest
		var request = URLRequest(url: url)
		request.httpMethod = "POST"

		// 5. Create multipart/form-data Body
		let boundary = "Boundary-\(UUID().uuidString)" // Corrected boundary format from image
		request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

		var body = Data()
		let filename = "\(UUID().uuidString).jpg"
		let fieldName = "file" // Field name for the file data

		// -- Append Image Data --
		// Note: Using force unwrap (!) as shown in the image, be cautious as it can crash if string conversion fails.
		body.append("--\(boundary)\r\n".data(using: .utf8)!)
		body.append("Content-Disposition: form-data; name=\"\(fieldName)\"; filename=\"\(filename)\"\r\n".data(using: .utf8)!)
		body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
		body.append(imageData)
		body.append("\r\n".data(using: .utf8)!)

		// -- Append Upload Preset --
		body.append("--\(boundary)\r\n".data(using: .utf8)!)
		body.append("Content-Disposition: form-data; name=\"upload_preset\"\r\n\r\n".data(using: .utf8)!)
		// Note: Force unwrap used here as well, matching the image.
		body.append("\(uploadPreset)\r\n".data(using: .utf8)!) // Appending the preset value directly

		// -- Add Closing Boundary --
		body.append("--\(boundary)--\r\n".data(using: .utf8)!)

		// 6. Attach Body to Request
		request.httpBody = body

		// 7. Perform Network Request & Get Data
		// Note: This basic error handling matches the image. More robust error checking (status codes, etc.) is usually recommended.
		let (data, _) = try await URLSession.shared.data(for: request)

		// 8. Parse JSON Response using JSONSerialization (as shown in image)
		let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]

		// 9. Extract secure_url
		return json?["secure_url"] as? String
	}
}
