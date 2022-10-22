//
//  NonFatalHandler.swift
//  
//
//  Created by Lukas Ruzicka on 28.10.2022.
//

import FirebaseCrashlytics

public struct NonFatalHandler {

    public enum NonFatal {

        case missingValue(valueType: String, key: String, domain: String)
    }

    public static func log(_ nonFatal: NonFatal) {
        let nsError: NSError
        switch nonFatal {
        case .missingValue(let valueType, let key, let domain):
            nsError = .init(domain: "missingValue_\(domain)_\(valueType)_for_\(key)",
                            code: 1)
        }
        Crashlytics.crashlytics().record(error: nsError)
    }
}
