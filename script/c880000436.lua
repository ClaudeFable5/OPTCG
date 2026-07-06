-- AUTO-GENERATED: OP03-070 / 몽키 D. 루피
-- rules_id=OP03-070 script_id=880000436 fingerprint=ce5d0d3e3697b81bb41a2dd9cea48a86cf47389080046e1bcf128cc6781963ef
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-070]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            keyword=[[RUSH]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_eq=5,
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】두웅!!-1(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다), 자신의 패에서 코스트 5인 캐릭터 카드 1장을 버릴 수 있다: 이번 턴 동안, 이 캐릭터는 【속공】을 얻는다.
(이 카드는 등장한 턴에 어택할 수 있다)]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-070]],
    schema_version=1,
  })
end
