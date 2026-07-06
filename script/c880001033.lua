-- AUTO-GENERATED: OP08-057 / 킹
-- rules_id=OP08-057 script_id=880001033 fingerprint=324bfd8835a5570d79465c0dd334021c7a24d4391a9bc63261f91be90e17f8ce
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-057]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[CHOOSE]],
            option_conditions={
              {
                {
                  count=5,
                  op=[[HAND_LTE]],
                  player=[[YOU]],
                },
              },
              {},
            },
            options={
              {
                {
                  count=1,
                  op=[[DRAW]],
                  player=[[YOU]],
                },
              },
              {
                {
                  amount=-2,
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
            },
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            count=2,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】두웅!!-2(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다): 아래에서 하나를 선택한다.
· 자신의 패가 5장 이하인 경우, 카드를 1장 뽑는다.
· 이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -2.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-057]],
    schema_version=1,
  })
end
