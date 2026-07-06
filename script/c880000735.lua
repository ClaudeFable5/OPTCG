-- AUTO-GENERATED: OP06-001 / 우타
-- rules_id=OP06-001 script_id=880000735 fingerprint=d390bfe7243cf37695c89d5fd1bab5f4ae6cff2b2bf25ff2dfcc8b22734344db
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-001]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[RESTED]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              trait=[[FILM]],
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 패에서 《FILM》 특징을 가진 카드 1장을 버릴 수 있다: 이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -2000. 그 후, 두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-001]],
    schema_version=1,
  })
end
