Pod::Spec.new do |s|
  s.name          = 'RSKInteractableLabel'
  s.version       = '1.1.0'
  s.summary       = 'The type of object that represents an interactable label.'
  s.description   = <<-DESC
                   The type of object that represents an interactable label. RSKInteractableLabel provides the ability to get the index of the character falling under the given point, expressed in the label's coordinate system.
                   DESC
  s.homepage      = 'https://github.com/rsk-lab/RSKInteractableLabel'
  s.license       = { :type => 'RPL-1.5 / R.SK Lab Professional', :file => 'COPYRIGHT.md' }
  s.authors       = { 'Ruslan Skorb' => 'ruslan@rsk-lab.com' }
  s.source        = { :git => 'https://github.com/rsk-lab/RSKInteractableLabel.git', :tag => s.version.to_s }
  s.platform      = :ios, '10.0'
  s.swift_version = '5.3'
  s.source_files  = 'RSKInteractableLabel/*.{h,swift}'
  s.requires_arc  = true
end
