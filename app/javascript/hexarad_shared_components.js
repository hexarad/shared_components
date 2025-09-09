// Main entry point for HexaradSharedComponents JavaScript
// Import all controllers
import DownloadAnimationController from "./hexarad_shared_components/controllers/download_animation_controller"

// Export function to register all controllers at once
export function registerAllControllers(application) {
  application.register("download-animation", DownloadAnimationController)
  // Add new controllers here as they're created
}

// Also export controllers individually for flexibility
export { DownloadAnimationController }