-- AUTO-GENERATED: ST05-011 / 더글라스 불릿
-- rules_id=ST05-011 script_id=880001793 fingerprint=d246a84829ec2d52e82e187ffbd31ef41790bf7e57e4639bb98ed853467cf1f6
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST05-011]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=2,
              filter={
                cost_lte=6,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            duration=[[THIS_TURN]],
            keyword=[[DOUBLE_ATTACK]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            ["then"]=true,
          },
        },
        conditions={},
        costs={
          {
            count=4,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】두웅!!-4(자신 필드의 두웅!!을 지정된 수 만큼 두웅!! 덱으로 되돌릴 수 있다): 상대의 코스트 6 이하인 캐릭터를 2장까지 레스트로 한다. 그 후, 이번 턴 동안, 이 캐릭터는 【더블 어택】을 얻는다.
(이 카드가 주는 대미지는 2가 된다)]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST05-011]],
    schema_version=1,
  })
end
