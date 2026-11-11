import React from 'react';

export default function FrenchCurlHair({ language }) {
  const isFrench = language === 'fr';

  return (
    <div className="hair-guide-card french-curl-card">
      <div className="french-curl-photo">
        <img
          src="/images/french-curl-cutout.webp"
          alt={isFrench
            ? 'Paquet de mèches Freetress 3X French Curl Braid, 22 pouces, noires'
            : 'Freetress 3X French Curl Braid hair package, 22 inches, black'}
          loading="lazy"
          width="531"
          height="794"
        />
      </div>
      <h3>{isFrench ? 'Cheveux French Curl' : 'French Curl Hair'}</h3>
      <p>
        {isFrench
          ? <>Pour les styles French Curl, achetez <strong>au moins 3 paquets de mèches Freetress 3X French Curl Braid.</strong></>
          : <>For French Curl styles, purchase <strong>at least 3 packs of Freetress 3X French Curl Braid.</strong></>}
      </p>
      <p className="hair-guide-warning">
        {isFrench
          ? 'Si vous achetez une autre marque ou un autre type de cheveux, envoyez une photo à Lynna pour approbation avant votre rendez-vous.'
          : 'If you buy another brand or type of braiding hair, send Lynna a photo to verify it before your appointment.'}
      </p>
    </div>
  );
}
