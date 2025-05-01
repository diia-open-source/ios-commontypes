
import Foundation
import DiiaMVPModule

/// The callback serves for creation a heavy BaseModule that can't be inited via lazy var (for example object is injected from an external module). Read it as a lazy var that can be passed from one swift module to another
public typealias CreateModuleCallback = () -> BaseModule
