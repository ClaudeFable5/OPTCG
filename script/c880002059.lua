-- AUTO-GENERATED: P-076 / 사카즈키
-- rules_id=P-076 script_id=880002059 fingerprint=369fb5a3e24b4b96927b063b8de9e51249e5d2c6deda93e6fc4d4531481a704d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-076]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-1,
            duration=[[THIS_TURN]],
            op=[[MODIFY_COST]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              trait=[[해군]],
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 패에서 《해군》 특징을 가진 카드 1장을 버릴 수 있다: 이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -1.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[P-076]],
    schema_version=1,
  })
end
