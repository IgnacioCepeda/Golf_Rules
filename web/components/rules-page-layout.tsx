import { AppSidebar } from "@/components/app-sidebar"
import {
  Breadcrumb,
  BreadcrumbItem,
  BreadcrumbLink,
  BreadcrumbList,
  BreadcrumbPage,
  BreadcrumbSeparator,
} from "@/components/ui/breadcrumb"
import { Separator } from "@/components/ui/separator"
import { SidebarInset, SidebarProvider, SidebarTrigger } from "@/components/ui/sidebar"
import { HomeIcon } from "lucide-react"
import type { ReactNode } from "react"

type RulesPageLayoutProps = {
  title: string
  children: ReactNode
}

export function RulesPageLayout({ title, children }: RulesPageLayoutProps) {
  return (
    <SidebarProvider>
      <AppSidebar />
      <SidebarInset>
        <header className="flex h-16 shrink-0 items-center gap-2 border-b px-4">
          <SidebarTrigger className="-ml-1" />
          <Separator orientation="vertical" className="mr-2 data-vertical:h-4 data-vertical:self-auto" />
          <Breadcrumb>
            <BreadcrumbList>
              <BreadcrumbItem className="hidden md:block"><BreadcrumbLink href="/dashboard">La Liga</BreadcrumbLink></BreadcrumbItem>
              <BreadcrumbSeparator className="hidden md:block" />
              <BreadcrumbItem className="hidden md:block"><BreadcrumbLink href="/dashboard">Guía de reglas</BreadcrumbLink></BreadcrumbItem>
              <BreadcrumbSeparator className="hidden md:block" />
              <BreadcrumbItem><BreadcrumbPage>{title}</BreadcrumbPage></BreadcrumbItem>
            </BreadcrumbList>
          </Breadcrumb>
          <a href="/dashboard" aria-label="Volver al menú principal" title="Menú principal" className="ml-auto inline-flex size-9 items-center justify-center rounded-md text-emerald-800 transition hover:bg-emerald-50 focus-visible:ring-2 focus-visible:ring-emerald-600 focus-visible:outline-none">
            <HomeIcon className="size-5" />
          </a>
        </header>
        <main className="flex flex-1 flex-col gap-6 p-4 md:p-8">{children}</main>
      </SidebarInset>
    </SidebarProvider>
  )
}
