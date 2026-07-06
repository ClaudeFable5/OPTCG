-- AUTO-GENERATED: OP08-010 / 하이킹 베어
-- rules_id=OP08-010 script_id=880000986 fingerprint=9c0091a726e8593d335f803ddb6cc26e0d476e26a7352486c7b5a840feb2e1d5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-010]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                exclude_self=true,
                trait=[[동물]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【두웅!!×1】【기동: 메인】【턴 1회】이번 턴 동안, 이 캐릭터 이외의 자신의 《동물》 특징을 가진 캐릭터 1장까지의 파워 +1000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-010]],
    schema_version=1,
  })
end
