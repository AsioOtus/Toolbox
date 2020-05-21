import os



extension Keychain {
	public final class Settings {
		public static var current: Settings = .default
		
		public var logging: Logging
		public let genericPasswords: GenericPasswords
		
		public init (
			logging: Logging = .default,
			genericPasswords: GenericPasswords
		) {
			self.logging = logging
			self.genericPasswords = genericPasswords
		}
		
		internal static let `default` = Settings()
		private init () {
			self.logging = .default
			self.genericPasswords = .default
		}
	}
}



extension Keychain.Settings {
	public final class Logging {
		public var enable: Bool
		public var level: OSLogType
		
		public var enableKeychainIdentifierLogging: Bool
		public var enableQueryLogging: Bool
		public var enableValuesLogging: Bool
		
		public var loggingProvider: KeychainLoggingProvider?
		
		public static let `default` = Logging()
		public init (
			enable: Bool = true,
			level: OSLogType = .default,
			
			enableKeychainIdentifierLogging: Bool = true,
			enableQueryLogging: Bool = false,
			enableValuesLogging: Bool = false,
			
			loggingProvider: KeychainLoggingProvider? = nil
		) {
			self.enable = enable
			self.level = level
			
			self.enableKeychainIdentifierLogging = enableKeychainIdentifierLogging
			self.enableQueryLogging = enableQueryLogging
			self.enableValuesLogging = enableValuesLogging
			
			self.loggingProvider = loggingProvider
		}
	}
}


	
extension Keychain.Settings {
	public final class GenericPasswords {
		public var logging: Logging
		
		public let prefixProvider: KeychainGenericPasswordsPrefixProvidable?
		
		public init (
			prefixProvider: KeychainGenericPasswordsPrefixProvidable,
			logging: Logging = .default
		) {
			self.prefixProvider = prefixProvider
			self.logging = logging
		}
		
		internal static let `default` = GenericPasswords()
		private init () {
			self.prefixProvider = nil
			self.logging = .default
		}
	}
}



extension Keychain.Settings.GenericPasswords {
	public final class Logging {
		public var enable: Bool
		public var level: OSLogType
		
		public var enableKeychainIdentifierLogging: Bool
		public var enableQueryLogging: Bool
		public var enableValuesLogging: Bool
		
		public var loggingProvider: KeychainGenericPasswordsLoggingProvider?
		
		public static let `default` = Logging()
		public init (
			enable: Bool = true,
			level: OSLogType = .default,
			
			enableKeychainIdentifierLogging: Bool = true,
			enableQueryLogging: Bool = false,
			enableValuesLogging: Bool = false,
			
			loggerProvidable: KeychainGenericPasswordsLoggingProvider? = nil
		) {
			self.enable = enable
			self.level = level
			
			self.enableKeychainIdentifierLogging = enableKeychainIdentifierLogging
			self.enableQueryLogging = enableQueryLogging
			self.enableValuesLogging = enableValuesLogging
			
			self.loggingProvider = loggerProvidable
		}
	}
}
