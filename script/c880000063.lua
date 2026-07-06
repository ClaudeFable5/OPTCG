-- AUTO-GENERATED: EB02-002 / 사보
-- rules_id=EB02-002 script_id=880000063 fingerprint=aaaf40cb5d3324f8b79ae5c0dd7f69ccee4e4bce6c2f88a3c51e56b4e7184d2a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB02-002]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                name_neq=[[사보]],
                trait=[[혁명군]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 레스트할 수 있다: 이번 턴 동안, 자신의 「사보」 이외의 《혁명군》 특징을 가진 캐릭터 1장까지의 파워 +2000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB02-002]],
    schema_version=1,
  })
end
