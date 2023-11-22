import Image from 'next/image';

const Header = () => {
  return (
    <div className="hd1 p-1 md:p-2 w-full flex items-center justify-between" style={{ backgroundColor: '#403D39' }}>
      <div className="flex items-center">
        <div className="mr-2 pl-10" style={{ width: '40%' }}>
          {/* Make the logo take up 50% of the width */}
          <Image src="/wide_logo.png" alt="Logo" width={500} height={150} layout="responsive" />
        </div>
        <div className="flex items-center">
          <a href="/" className="text-white hover:text-gray-300 transition duration-300 pl-2 md:pl-10 text-sm md:text-base">
            Dashboard
          </a>
          <a href="/settings" className="text-white hover:text-gray-300 transition duration-300 ml-2 text-sm md:text-base md:pl-10">
            Settings
          </a>
        </div>
      </div>
    </div>
  );
};

export default Header;
