import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button", "downloadingState", "completeState", "dots"]

  connect() {
    this.animationFrame = null
    this.startTime = null
  }

  disconnect() {
    if (this.animationFrame) {
      cancelAnimationFrame(this.animationFrame)
    }
  }

  async download(event) {
    event.preventDefault()

    const downloadUrl = event.currentTarget.href

    // Show downloading animation immediately
    this.showDownloadingState()

    try {
      // Fetch the file as a blob
      const response = await fetch(downloadUrl, {
        method: 'GET',
        credentials: 'same-origin'
      })

      if (!response.ok) {
        throw new Error('Download failed')
      }

      // Get the blob data
      const blob = await response.blob()

      // Extract filename from response headers or use default
      const contentDisposition = response.headers.get('content-disposition')
      let filename = 'download'
      if (contentDisposition) {
        const filenameMatch = contentDisposition.match(/filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/)
          if (filenameMatch) {
            filename = filenameMatch[1].replace(/['"]/g, '')
          }
      }

      // Create blob URL and trigger download
      const blobUrl = URL.createObjectURL(blob)
      const downloadLink = document.createElement('a')
      downloadLink.href = blobUrl
      downloadLink.download = filename
      downloadLink.style.display = 'none'

      document.body.appendChild(downloadLink)
      downloadLink.click()
      document.body.removeChild(downloadLink)

      // Clean up blob URL
      URL.revokeObjectURL(blobUrl)

      // Show complete state since download actually finished
      this.showCompleteState()

    } catch (error) {
      console.error('Download failed:', error)
      // Reset to button on error
      this.resetToButton()
    }
  }


  showDownloadingState() {
    this.buttonTarget.classList.add("d-none")
    this.downloadingStateTarget.classList.remove("d-none")
    this.completeStateTarget.classList.add("d-none")
    this.startDotsAnimation()
  }

  showCompleteState() {
    this.stopAnimation()
    this.downloadingStateTarget.classList.add("d-none")
    this.completeStateTarget.classList.remove("d-none")
  }

  resetToButton() {
    this.completeStateTarget.classList.add("d-none")
    this.buttonTarget.classList.remove("d-none")
  }

  startDotsAnimation() {
    this.startTime = Date.now()

    // Define the exact color sequence from the original CSS
    const colorPattern = [
      '#011a23', // Dark blue
      '#ffc800', // Yellow
      '#00baff', // Cyan
      '#011a23', // Dark blue
      '#ffc800', // Yellow
      '#00baff', // Cyan
      '#011a23', // Dark blue
      '#ffffff', // White
      '#ffffff'  // White
    ]

    // Start with a longer sequence for smooth flow
    const extendedColors = [...colorPattern, ...colorPattern, ...colorPattern]

    // Initialize dots with starting colors immediately
    const dots = this.dotsTargets
    dots.forEach((dot, index) => {
      const color = extendedColors[index % extendedColors.length]
      dot.style.backgroundColor = color

      if (color === '#ffffff') {
        dot.style.boxShadow = '0 2px 4px rgba(0, 0, 0, 0.1)'
      } else {
        dot.style.boxShadow = `0 2px 8px ${color}40`
      }
    })

    let frameCount = 0
    const frameDelay = 250 // milliseconds between color shifts

    const animate = () => {
      const elapsed = Date.now() - this.startTime
      const currentFrame = Math.floor(elapsed / frameDelay)

      if (currentFrame !== frameCount) {
        frameCount = currentFrame

        dots.forEach((dot, index) => {
          // Calculate which color this dot should have
          // Colors shift to the right, so we subtract the frame count
          const colorIndex = (index - frameCount) % extendedColors.length
          // Handle negative modulo
          const adjustedIndex = colorIndex < 0 ? colorIndex + extendedColors.length : colorIndex

          const color = extendedColors[adjustedIndex]
          dot.style.backgroundColor = color

          // Add subtle shadow for non-white colors
          if (color === '#ffffff') {
            dot.style.boxShadow = '0 2px 4px rgba(0, 0, 0, 0.1)'
          } else {
            dot.style.boxShadow = `0 2px 8px ${color}40` // 40 is 25% opacity in hex
          }
        })
      }

      this.animationFrame = requestAnimationFrame(animate)
    }

    animate()
  }

  stopAnimation() {
    if (this.animationFrame) {
      cancelAnimationFrame(this.animationFrame)
      this.animationFrame = null
    }

    // Reset dots to neutral color
    const dots = this.dotsTargets
    dots.forEach(dot => {
      dot.style.backgroundColor = '#d0d0d0'
      dot.style.boxShadow = '0 2px 8px rgba(0, 0, 0, 0.1)'
    })
  }
}
